class FaqsController < ApplicationController
  before_filter :authenticate_partner!
  before_filter :record, only: ['update', 'create', 'destroy']
  # 一覧アクション。
  def index
    faq_category_id = params[:faq_category_id]
    if faq_category_id
      @faq_list = Faq.where("faq_category_id = ?", faq_category_id).order(:id).
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

  # 検索アクション。
  def search
    @faq_list = Faq.where("question like ?", "%#{params[:question]}%").order(:id).
      paginate(page: params[:page], per_page: 5)

    render "index"
  end
end
