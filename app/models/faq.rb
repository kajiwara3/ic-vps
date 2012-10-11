class Faq < ActiveRecord::Base
  belongs_to :faq_category, class_name: "FaqCategory"

  # バリデーションメソッド
  validates :faq_category_id, presence: true
  validates :question, presence: true
  validates :answer, presence: true
end
