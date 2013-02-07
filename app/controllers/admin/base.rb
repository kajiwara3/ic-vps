# coding: utf-8
class Admin::Base < ApplicationController
  before_filter :authorize
  before_filter :admin_login_required
  skip_before_filter :record
  # パンくず設定
  add_crumb 'HOME', "/admin"

  # リクエストごとに認証を行うアクション。
  private
  def authorize
    if session[:administrator_id]
      @current_administrator = Administrator.find(session[:administrator_id])
      session.delete(:administrator_id) unless @current_administrator
    end
  end

  # 管理者ではない場合にログイン画面にリダイレクトするアクション。
  def admin_login_required
    redirect_to :admin_root unless @current_administrator
  end
end