class FaqCategoriesController < ApplicationController
  def index
    @faq_categories = FaqCategory.order(:id).
      paginate(page: params[:page], per_page: 5)
  end
end
