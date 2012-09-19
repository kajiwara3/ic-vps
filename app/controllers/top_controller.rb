# coding: utf-8
class TopController < ApplicationController
  # パートナーページTOPアクション。
  def index
    @notifications = Notification.order("id desc").limit(5)
  end
end
