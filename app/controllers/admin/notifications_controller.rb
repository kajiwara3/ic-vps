# coding: utf-8
class Admin::NotificationsController < ApplicationController
  # 一覧表示アクション
  def index
    @notifications = Notification.order("id").
      paginate(page: params[:page], per_page: 5)
  end
  
  # 詳細表示アクション
  def show
    @notification = Notification.find(params[:id])
  end

  # 新規作成フォーム表示アクション
  def new
    @notification = Notification.new
  end

  # 編集アクション
  def edit
    @notification = Notification.find(params[:id])
  end
  
  # 新規作成アクション
  def create
    @notification = Notification.new(params[:notification])
    if @notification.save
      redirect_to :admin_notifications, notice: "お知らせを追加しました"
    else
      render "new"
    end
  end
  
  # 更新アクション
  def update
    @notification = Notification.find(params[:id])
    @notification.assign_attributes(params[:notification])
    if @notification.save
      redirect_to [:admin, @notification], notice: "お知らせを更新しました"
    else
      render "edit"
    end
  end
  
  # 削除アクション
  def destroy
    @notification = Notification.find(params[:id])
    if @notification.destroy
      redirect_to :admin_notifications, notice: "お知らせを削除しました"
    else
      render "snow"
    end
  end
end
