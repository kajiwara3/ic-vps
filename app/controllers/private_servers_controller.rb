# coding: utf-8
class PrivateServersController < ApplicationController
  include VpsManager

  def show
    @server = PrivateServer.find(params[:id])
  end

  def new
    @server = PrivateServer.new
    @server.partner_id = current_partner.id
    @domain_templates = DomainTemplate.order("id")
  end

  def create
    begin
      @server = PrivateServer.new(params[:private_server])
      @server.private_server_code = generate_private_server_code(params[:private_server])
      @server.save
      redirect_to "/vps_management", notice: "VPSを追加しました"
    rescue
    end
  end

  def destroy
  end

  # vpsインスタンス起動用アクション
  def start
    server_id = params[:server_id]
    @server = PrivateServer.find(server_id)
    domain_name = params[:domain_name]
    domain = get_domain_connection_by_name(domain_name)
    startup domain
    flash[:notice] = "サーバーを起動しました"
    redirect_to action: "show"
  end

  # vpsインスタンス停止アクション。
  def stop
    server_id = params[:server_id]
    @server = PrivateServer.find(server_id)
    domain_name = params[:domain_name]
    domain = get_domain_connection_by_name(domain_name)
    shutdown domain
    flash[:notice] = "サーバーを停止しました。"
    redirect_to action: "show"
  end

  # vpsインスタン再起動用アクション
  def reboot
  end
end
