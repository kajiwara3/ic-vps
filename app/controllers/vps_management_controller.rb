# coidng: utf-8
class VpsManagementController < ApplicationController
  before_filter :authenticate_partner!
  include VpsManager

  # 一覧表示アクション。
  def index
    list_vps
    @server_list = current_partner.private_servers.
                        order("id").
                        paginate(page: params[:page], per_page: 5)
  end

  def show
  end
end
