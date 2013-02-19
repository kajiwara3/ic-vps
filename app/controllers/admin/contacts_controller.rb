# coding: utf-8
class Admin::ContactsController < Admin::Base
  before_filter :authenticate_admin_administrator!

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
    @contact_statuses = ContactStatus.all
    @contact = Contact.find params[:id]
  end

  def update
    @contact = Contact.find params[:id]
    @contact.assign_attributes params[:contact]
    if @contact.save
      redirect_to [:admin, @contact], notice: '更新しました。'
    end
  end
end
