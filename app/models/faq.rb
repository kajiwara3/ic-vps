class Faq < ActiveRecord::Base
  belongs_to :admin_faq_category, class_name: "Admin::FaqCategory"
end
