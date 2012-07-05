# coidng: utf-8
class VpsManagementController < ApplicationController
  before_filter :authenticate_partner!

  # 一覧表示アクション。
  def index
    begin
      require 'libvirt'
      url = "qemu+tcp://root@192.168.0.140:16509/system"
      conn = Libvirt::open(url)
      puts conn.list_defined_domains;
    rescue => e
      raise e.class, "#{e.message} -> piyo ", e.backtrace
    end
    @server_list = current_partner.private_servers.
                        order("id").
                        paginate(page: params[:page], per_page: 5)
  end

  def show
  end
end
