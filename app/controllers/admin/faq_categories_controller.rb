# coding: utf-8
class Admin::FaqCategoriesController < Admin::Base
  layout "admin_application"
  # GET /admin/faq_categories
  # GET /admin/faq_categories.json
  def index
    @admin_faq_categories = Admin::FaqCategory.order(:id).
      paginate(page: params[:page], per_page: 5)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @admin_faq_categories }
    end
  end

  # GET /admin/faq_categories/1
  # GET /admin/faq_categories/1.json
  def show
    @admin_faq_category = Admin::FaqCategory.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @admin_faq_category }
    end
  end

  # GET /admin/faq_categories/new
  # GET /admin/faq_categories/new.json
  def new
    @admin_faq_category = Admin::FaqCategory.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @admin_faq_category }
    end
  end

  # GET /admin/faq_categories/1/edit
  def edit
    @admin_faq_category = Admin::FaqCategory.find(params[:id])
  end

  # POST /admin/faq_categories
  # POST /admin/faq_categories.json
  def create
    @admin_faq_category = Admin::FaqCategory.new(params[:admin_faq_category])

    respond_to do |format|
      if @admin_faq_category.save
        format.html { redirect_to @admin_faq_category, notice: 'FAQを追加しました' }
        format.json { render json: @admin_faq_category, status: :created, location: @admin_faq_category }
      else
        format.html { render action: "new" }
        format.json { render json: @admin_faq_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /admin/faq_categories/1
  # PUT /admin/faq_categories/1.json
  def update
    @admin_faq_category = Admin::FaqCategory.find(params[:id])

    respond_to do |format|
      if @admin_faq_category.update_attributes(params[:admin_faq_category])
        format.html { redirect_to @admin_faq_category, notice: 'FAQを更新しました' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @admin_faq_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/faq_categories/1
  # DELETE /admin/faq_categories/1.json
  def destroy
    @admin_faq_category = Admin::FaqCategory.find(params[:id])
    @admin_faq_category.destroy

    respond_to do |format|
      format.html { redirect_to admin_faq_categories_url }
      format.json { head :no_content }
    end
  end
end
