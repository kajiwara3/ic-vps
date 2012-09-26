class Admin::FaqsController < Admin::Base
  layout "admin_application"

  # GET /admin/faqs
  # 一覧表示アクション。
  def index
    @faq_list = Faq.order(:id).
      paginate(page: params[:page], per_page: 5)
  end

  def show
    @faq = Faq.find(params[:id])
  end

  def edit
    @faq = Faq.find(params[:id])
  end
end
