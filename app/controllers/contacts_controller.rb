# coding: utf-8
class ContactsController < ApplicationController
  before_filter :authenticate_partner!
  def index
    @contact_statuses = ContactStatus.all
    #logger current_partner.id
    @search = Contact.search(params[:q])
    # @contact_list = Kaminari.paginate_array(@search.result).page(params[:page]).per(5)
    @contact_list = Kaminari.paginate_array(@search.result.
                                            onry_current_partner current_partner).
                                            page(params[:page]).per(5)
    respond_to do |format|
      format.html
      format.js
    end
  end

  def show
    @contact = Contact.find(params[:id])
  end

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new
    @contact.assign_attributes params[:contact]
    @contact.partner_id = current_partner.id
    if @contact.save
      return redirect_to @contact, notice: "お問い合わせを賜りました"
    end
    render "new"
  end
end