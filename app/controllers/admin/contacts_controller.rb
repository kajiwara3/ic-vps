# coding: utf-8
class Admin::ContactsController < Admin::Base
  layout "admin_application"

  def index
    @contact_statuses = ContactStatus.all
    @search = Contact.search(params[:q])
    @contact_list = Kaminari.paginate_array(@search.result).
                                            page(params[:page]).per(10)
    respond_to do |format|
      format.html
      format.js
    end
  end

  def show
    @contact = Contact.find params[:id]
  end

  def edit
    @contact = Contact.find params[:id]
  end
end
