class Admin::TopController < Admin::Base
  layout "admin_application"

  #indexアクション
  def index
    @contacts = Contact.last_five_contacts
    @notifications = Notification.readable.limit(5)
  end
end
