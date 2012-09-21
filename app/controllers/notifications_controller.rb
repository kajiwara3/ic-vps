# cofing: utf-8
class NotificationsController < ApplicationController
  # お知らせの一覧表示アクション。
  def index
    @notifications =Notification.order("id desc").
      paginate(page: params[:page], per_page: 10)
  end

  # お知らせの詳細表示アクション。
  def show
    @notification = Notification.find(params[:id])
  end
end
