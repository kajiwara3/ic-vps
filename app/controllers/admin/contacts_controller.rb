# coding: utf-8
class Admin::ContactsController < Admin::Base
  layout "admin_application"

  def index
    @contact_list = Kaminari.paginate_array(Contact.order(:id)).
                      page(params[:page]).per(5)
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
