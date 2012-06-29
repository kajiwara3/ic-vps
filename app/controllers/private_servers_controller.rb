# coding: utf-8
class PrivateServersController < ApplicationController
  def show
    @server = PrivateServer.find(params[:id])
  end

  def destroy

  end
end
