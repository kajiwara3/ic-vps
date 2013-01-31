class Contact < ActiveRecord::Base
  belongs_to :partner, class_name: "Partner"
  belongs_to :contact_status, class_name: "ContactStatus"
  validates :subject, :body, presence: true

  scope :onry_current_partner,
    lambda {|partner|
      where 'partner_id = ?', partner.id
    }
end
