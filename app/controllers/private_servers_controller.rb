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
    require "rexml/document"
    @server = PrivateServer.new(params[:private_server])
    @server.private_server_code = generate_private_server_code(params[:private_server])
    domain_template_id = params[:private_server][:domain_template_id]

    begin
      domain_template = DomainTemplate.find(domain_template_id) if @server.valid?
      xml_data = domain_template.xml_data
      xmldoc = REXML::Document.new(xml_data)
      elems = xmldoc.elements

      xmldoc.elements['/domain/name'].text = params[:private_server][:name]
#      logger.debug elems['/domain/name'].text
      #logger.debug xmldoc
      define_domain xmldoc.to_s

      @server.private_server_code = "1-2-2-server"
      @server.save

      redirect_to "/vps_management", notice: "サーバーを追加しました"
    rescue => e
      logger.debug e.message

      flash[:notice] = "サーバーの登録に失敗しました"
      @domain_templates = DomainTemplate.order("id")
      render "new"
    end
  end

  def destroy
    @private_server = PrivateServer.find(params[:id])
    begin
      PrivateServer.transaction do
        @domain = get_domain_connection_by_name(@private_server.name)
        logger.debug(@private_server.name)
        @domain.undefine
        @private_server.destroy
        @private_server.save
      end
      redirect_to "/vps_managememt", notice: "ドメインを削除しました"
    rescue => e
      logger.debug e.message
      flash[:notice] = "削除に失敗しました"
      redirect_to action: "show"
    end
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
