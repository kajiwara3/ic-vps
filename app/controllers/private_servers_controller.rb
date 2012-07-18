# coding: utf-8
class PrivateServersController < ApplicationController
  include VpsManager

  def show
    @server = PrivateServer.find(params[:id])
  end

  def destroy
  end

  # vpsインスタンス起動用アクション
  def start(domain_name)
    @server = PrivateServer.find(params[:server_id])
    domain = get_domain_connection_by_name(domain_name)
    startup_domain domain
    flash[:notice] = "サーバーを起動しました"
    redirect_to action: "show"
  end

  # vpsインスタンス停止アクション。
  def stop(domain_name)
    @server = PrivateServer.find(params[:server_id])
    domain = get_domain_connection_by_name(domain_name)
    shutdown_domain domain
    flash[:notice] = "サーバーを停止しました。"
    redirect_to action: "show"
  end

  # vpsインスタン再起動用アクション
  def reboot
  end
end