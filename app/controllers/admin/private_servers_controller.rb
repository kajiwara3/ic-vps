# coding: utf-8
class Admin::PrivateServersController < Admin::Base
  def new
    @partner = Partner.find_by_id(params[:partner_id])
    @server = PrivateServer.new(partner_id: @partner.id)
  end

  def create
    @partner = Partner.find_by_id(params[:private_server][:partner_id])
    @server = PrivateServer.new params[:private_server]
    @server.private_server_code = "#{@partner.id}_#{@server.name}"
    if @server.save
      return redirect_to [:admin, @partner], notice: "サーバーを追加しました"
    end
    render 'new'
  end
end
