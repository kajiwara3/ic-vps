#coding: utf-8
class Admin::PartnersController < Admin::Base
  before_filter :authenticate_admin_administrator!

  add_crumb "パートナーTOP", "/admin/partners"
  # 一覧表示アクション
  def index
    @partners = Kaminari.paginate_array(Partner.order "id").
                  page(params[:page]).per(5)
    respond_to do |format|
      format.html
      format.js
    end
  end

  # 詳細表示アクション
  def show
    add_crumb "パートナー詳細", "/admin/partners/#{params[:id]}"
    @partner = Partner.find(params[:id])
    @private_servers = Kaminari.paginate_array(PrivateServer.myservers @partner).
                        page(params[:page]).per(5)
  end

  # パートナー追加フォーム表示アクション
  def new
    add_crumb "パートナー追加", "/admin/partners/new"
    @partner = Partner.new
  end

  # パートナー情報編集フォーム表示アクション
  def edit
    add_crumb "パートナー編集", "/admin/partners/#{params[:id]}/edit"
    @partner = Partner.find(params[:id])
  end

  # パートナー追加アクション
  def create
    @partner = Partner.new(params[:partner])
    if @partner.save
      redirect_to :admin_partners, notice: "パートナーを追加しました"
    else
      render "new"
    end
  end

  # パートナー更新アクション
  def update
    @partner = Partner.find(params[:id])
    @partner.assign_attributes(params[:partner])
    if @partner.save
      redirect_to [:admin, @partner], notice: "パートナー情報を更新しました"
    else
      render "edit"
    end
  end

  # パートナー削除アクション
  def destroy
    @partner = Partner.find(params[:id])
    if @partner.destroy
      redirect_to :admin_partners, notice: "パートナー情報を削除しました"
    else
      render "show"
    end
  end
end
