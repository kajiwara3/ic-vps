# coding: utf-8
class PrivateServersController < ApplicationController
  def show
    @server = PrivateServer.find(params[:id])
  end

  def destroy
  end

  # vpsインスタンス停止アクション。
  def stop
    @server = PrivateServer.find(params[:server_id])
    flash[:notice] = "サーバーを停止しました。"
    redirect_to action: "show"
  end

  # vpsインスタン再起動用アクション
  def reboot
  end

  # vpsインスタンス起動用アクション
  def start
  end
end