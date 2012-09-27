# coding: utf-8
class Admin::FaqsController < Admin::Base
  layout "admin_application"

  # 一覧表示アクション。
  def index
    @faq_list = Faq.order(:id).
      paginate(page: params[:page], per_page: 5)
  end

  # 詳細表示アクション、
  def show
    @faq = Faq.find(params[:id])
  end

  # 編集画面表示アクション。
  def edit
    @faq = Faq.find(params[:id])
    @faq_categories = Admin::FaqCategory.order(:id)
  end

  # 更新アクション。
  def update
    @faq = Faq.find(params[:id])
    @faq.assign_attributes params[:faq]

    if !@faq.save
      @faq_categories = Admin::FaqCategory.order(:id)
      return render "edit"
    end
    redirect_to :admin_faq, notice: "FAQを更新しました"
  end

  # 削除アクション。
  def destroy
    @faq = Faq.find params[:id]
    if !@faq.destroy
      flash[:alert] = "FAQ ID: [#{@faq.id}] の削除に失敗しました"
      return render "show"
    end
    redirect_to :admin_faqs, notice: "FAQ ID: [#{@faq.id}] を削除しました"
  end
end
