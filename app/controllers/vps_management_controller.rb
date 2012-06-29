# coidng: utf-8
class VpsManagementController < ApplicationController
  before_filter :authenticate_partner!

  # 一覧表示アクション。
  def index
    @server_list = current_partner.private_servers.
                        order("id").
                        paginate(page: params[:page], per_page: 5)
  end

  def show
  end
end
