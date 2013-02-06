class Admin::TopController < Admin::Base
  skip_before_filter :admin_login_required
  layout "admin_application"

  #indexアクション
  def index
    @contacts = Contact.last_five_contacts
  end
end
