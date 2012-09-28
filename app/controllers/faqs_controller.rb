class FaqsController < ApplicationController
  # 一覧アクション。
  def index
    faq_category_id = params[:faq_category_id]
    if faq_category_id && faq_category
      faq_category = Admin::FaqCategory.find(faq_category_id)
      @faq_list = Faq.where("admin_faq_category_id = #{faq_category_id}").order(:id).
        paginate(page: params[:page], per_page: 5)
      return
    end
    @faq_list = Faq.order(:id).
      paginate(page: params[:page], per_page: 5)
  end

  # 詳細表示アクション。
  def show
    @faq = Faq.find params[:id]
  end
end
