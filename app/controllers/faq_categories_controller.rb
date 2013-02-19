class FaqCategoriesController < ApplicationController
  before_filter :authenticate_partner!
  before_filter :record, only: ['update', 'create', 'destroy']
  def index
    @faq_categories = FaqCategory.order(:id).
      paginate(page: params[:page], per_page: 5)
  end
end
