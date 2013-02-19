# encoding: utf-8
#---
# Excerpted from "Agile Web Development with Rails, 4th Ed.",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material,
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose.
# Visit http://www.pragmaticprogrammer.com/titles/rails4 for more book information.
#
# 日本語版については http://ssl.ohmsha.co.jp/cgi-bin/menu.cgi?ISBN=978-4-274-06866-9
#---
# be sure to change these
set :user, 'ic-vps'
# set :domain, 'ic-vps-server'
set :domain, 'prod-ic-vps'
set :application, 'ic-vps'

# adjust if you are using RVM, remove if you are not
# $:.unshift(File.expand_path('./lib', ENV['rvm_path']))

require "rvm/capistrano"
set :rvm_ruby_string, '1.9.3'
# rvmがrootでインストールされている場合は不要
# set :rvm_type, :user

# file paths
# set :repository,  "#{user}@#{domain}:git/#{application}.git"
set :repository, "git://github.com/kajiwara3/ic-vps.git"
# set :deploy_to, "/home/#{user}/#{domain}"
set :deploy_to, "/home/#{user}"

# distribute your applications across servers (the instructions below put them
# all on the same server, defined above as 'domain', adjust as necessary)
role :app, domain
role :web, domain
role :db, domain, :primary => true

# you might need to set this if you aren't seeing password prompts
# default_run_options[:pty] = true

# As Capistrano executes in a non-interactive mode and therefore doesn't cause
# any of your shell profile scripts to be run, the following might be needed
# if (for example) you have locally installed gems or applications.  Note:
# this needs to contain the full values for the variables set, not simply
# the deltas.
# default_environment['PATH']='<your paths>:/usr/local/bin:/usr/bin:/bin'
# default_environment['GEM_PATH']='<your paths>:/usr/lib/ruby/gems/1.8'

# miscellaneous options
set :deploy_via, :remote_cache
set :scm, 'git'
set :branch, 'master'

=begin
set :branch do
  default_tag = `git tag`.split("\n").last

  tag = Capistrano::CLI.ui.ask "Tag to deploy (make sure to push the tag first): [#{default_tag}] "
  tag = default_tag if tag.empty?
  tag
end
=end

set :scm_verbose, true
# set :use_sudo, true
set :use_sudo, false
set :rails_env, :production

namespace :deploy do
  desc "cause Passenger to initiate a restart"
  task :restart do
    run "touch #{current_path}/tmp/restart.txt"
  end

  desc "reload the database with seed data"
  task :seed do
    run "cd #{current_path}; rake db:seed RAILS_ENV=#{rails_env}"
  end

  desc "Copy shared config files to current application."
  task :config_symlink do
    run "rm #{release_path}/config/database.yml"
    run "ln -s /home/ic-vps/config/database.yml #{release_path}/config/database.yml"
  end

  namespace :db do
    desc "Create Production Database"
    task :create do
      puts "\n\n=== Creating the Production Database! ===\n\n"
      run "cd #{current_path}; rake db:create RAILS_ENV=production"
      system "cap deploy:set_permissions"
    end
  end

  namespace :assets do
    task :precompile, :roles => :web, :except => { :no_release => true } do
      from = source.next_revision(current_revision)
      if capture("cd #{latest_release} && #{source.local.log(from)} app/assets/ | wc -l").to_i > 0
        run %Q{cd #{latest_release} && #{rake} RAILS_ENV=#{rails_env} #{asset_env} assets:precompile}
      else
        logger.info "Skipping asset pre-compilation because there were no asset changes"
      end
    end
  end
end

desc "install the necessary prerequisites"
task :bundle_install, :roles => :app do
  run "cd #{release_path} && bundle install"
end

after "deploy:update_code", :bundle_install

# 本コマンド実行時に、デプロイ先に配置してあるdatabase.ymlのシンボリックリンクを設定する
after "deploy:update","deploy:config_symlink"

# 本コマンド実行時に、デプロイ先に配置してあるdatabase.ymlのシンボリックリンクを設定する
before "deploy:migrate", "deploy:config_symlink"