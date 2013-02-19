# coding: utf-8
class VpsManagementController < ApplicationController
  include VpsManager
  before_filter :authenticate_partner!
  before_filter :record, only: ['update', 'create', 'destroy']

  # 一覧表示アクション。
  def index
    @server_list = Kaminari.paginate_array(current_partner.private_servers.
                        order("id")).page(params[:page]).per(5)
    respond_to do |format|
      format.html
      format.js
    end
  end

  # 詳細表示。
  def show
  end
end