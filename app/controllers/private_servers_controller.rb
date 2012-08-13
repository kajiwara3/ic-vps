# coding: utf-8
class PrivateServersController < ApplicationController
  include VpsManager

  def show
    @server = PrivateServer.find(params[:id])
  end

  def new
    @server = PrivateServer.new
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
