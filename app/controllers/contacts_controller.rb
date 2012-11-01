# coding: utf-8
class ContactsController < ApplicationController
  def index
    contact_status_ids = ContactStatus.where("contact_status_code != ?", 2).select('id')
    @contact_list = Kaminari.paginate_array(current_partner.contacts.
      where(contact_status_id: contact_status_ids)).
      page(params[:page]).per(5)
  end
end