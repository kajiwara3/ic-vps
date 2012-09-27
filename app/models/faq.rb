class Faq < ActiveRecord::Base
  belongs_to :admin_faq_category, class_name: "Admin::FaqCategory"

  # バリデーションメソッド
  validates :admin_faq_category_id, presence: true
  validates :question, presence: true
  validates :answer, presence: true
end
