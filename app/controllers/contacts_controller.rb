# coding: utf-8
class ContactsController < ApplicationController
  before_filter :authenticate_partner!
  def index
    # ログインしているアカウントの問い合わせのうち、完了以外のステータスのみ返す
    contact_status_ids = ContactStatus.where("contact_status_code != ?", 2).select('id')
    @contact_list = Kaminari.paginate_array(current_partner.contacts.
      where(contact_status_id: contact_status_ids)).
      page(params[:page]).per(5)
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