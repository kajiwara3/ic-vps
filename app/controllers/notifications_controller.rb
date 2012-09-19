# cofing: utf-8
class NotificationsController < ApplicationController
  def index
    @notifications =Notification.order("id desc").
      paginate(page: params[:page], per_page: 10)
  end

  def show
    @notification = Notification.find(params[:id])
  end
end
