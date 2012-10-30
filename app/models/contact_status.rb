class ContactStatus < ActiveRecord::Base
  has_many :contct, class_name: "Contact"
end
