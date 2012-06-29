# coding: utf-8
class Admin::AdministratorsController < Admin::Base
  add_crumb "管理者TOP", "/admin/administrators/"

  # indexアクション
  def index
    @administrators = Administrator.order(:id).
      paginate(page: params[:page], per_page: 5)
  end

  # 詳細表示アクション
  def show
    add_crumb "管理者詳細", "/admin/administrators/#{params[:id]}"
    @administrator = Administrator.find(params[:id])
  end

  # 管理者追加フォーム表示アクション
  def new
    add_crumb "管理者新規登録", "/admin/administrators/new"
    @administrator = Administrator.new
  end

  # 管理者情報編集フォーム表示アクション
  def edit
    add_crumb "管理者編集", "/admin/administrators/#{params[:id]}/edit"
    @administrator = Administrator.find(params[:id])
  end

  # 管理者追加アクション
  def create
    @administrator = Administrator.new(params[:administrator])
    if @administrator.save
      redirect_to :admin_administrators, notice: "管理者を追加しました"
    else
      render "new"
    end
  end

  # パートナー更新アクション
  def update
    @administrator = Administrator.find(params[:id])
    @administrator.assign_attributes(params[:administrator])
    if @administrator.save
      redirect_to [:admin, @administrator], notice: "管理者情報を更新しました"
    else
      render "edit"
    end
  end

  # パートナー削除アクション
  def destroy
    @administrator = Administrator.find(params[:id])
    if @administrator.destroy
      redirect_to [:admin, @administrator], notice: "管理者情報を削除しました"
    else
      render "show"
    end
  end
end
