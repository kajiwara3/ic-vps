class Contact < ActiveRecord::Base
  belongs_to :partner, class_name: "Partner"
  belongs_to :contact_status, class_name: "ContactStatus"
end
