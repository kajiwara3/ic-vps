# coding: utf-8
class VpsManagementController < ApplicationController
  before_filter :authenticate_partner!
  include VpsManager

  # 一覧表示アクション。
  def index
    @defined_domain_list = list_vps
    @active_domain_list = active_vps_list
    @server_list = current_partner.private_servers.
                        order("id").
                        paginate(page: params[:page], per_page: 5)
  end

  # 詳細表示。
  def show
  end
end