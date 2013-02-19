# cofing: utf-8
class NotificationsController < ApplicationController
  before_filter :record, only: ['update', 'create', 'destroy']
  # お知らせの一覧表示アクション。
  def index
    @notifications = Kaminari.paginate_array(Notification.order "id desc").
                      page(params[:page]).per(5)
    respond_to do |format|
      format.html
      format.js
    end
  end

  # お知らせの詳細表示アクション。
  def show
    @notification = Notification.find(params[:id])
  end
end
