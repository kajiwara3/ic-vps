# coding: utf-8
class Admin::ContactsController < Admin::Base
  layout "admin_application"

  def index
    @contact_list = Contact.order(:id).
      paginate(page: params[:page], per_page: 5)
  end

  def show
    @contact = Contact.find params[:id]
  end

  def edit
    @contact = Contact.find params[:id]
  end
end
