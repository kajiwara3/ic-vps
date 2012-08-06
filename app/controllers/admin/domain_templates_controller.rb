#coding: utf-8
# 管理者によるドメインのひな形登録用モジュール
class Admin::DomainTemplatesController < ApplicationController
  # 登録済みドメインテンプレートの一覧表示用アクション。
  def index
    @domain_list = DomainTemplate.order("id").
      paginate(page: params[:page], per_page: 5)
  end

  # 登録済みドメインテンプレートの詳細表示アクション。
  def show
    @domain_template = DomainTemplate.find(params[:id])
  end

  # ドメインテンプレートの登録画面表示アクション。
  def new
    @domain = DomainTemplate.new
  end

  # ドメインテンプレート編集画面表示アクション。
  def edit
    @domain = DomainTemplate.find(params[:id])
  end

  # ドメインテンプレート更新アクション。
  def update
    @domain = DomainTemplate.find(params[:id])
    if params[:domain_template][:xml_data]
      xml_data = params[:domain_template][:xml_data].read
      @domain.xml_data = xml_data
    end
    @domain.name = params[:domain_template][:name]
    if @domain.save
      redirect_to :admin_domain_templates, notice: "ドメインテンプレートを追加しました"
    else
      render "edit"
    end
  end

  # ドメインテンプレートの登録アクション
  def create
    @domain = DomainTemplate.new(params[:domain_template])
    xml_data = params[:domain_template][:xml_data].read if params[:domain_template][:xml_data]
    @domain.name = params[:domain_template][:name]
    @domain.xml_data = xml_data
    if @domain.save
      redirect_to :admin_domain_templates, notice: "ドメインテンプレートを追加しました"
    else
      render "new"
    end
  end

  def destroy
    @domain_template = DomainTemplate.find(params[:id])
    if @domain_template.destroy
      redirect_to [:admin, @domain_template], notice: "ドメインテンプレート情報を削除しました"
    else
      render "show"
    end
  end
end
