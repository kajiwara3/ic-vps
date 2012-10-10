# coding: utf-8
class FaqCategory < ActiveRecord::Base
  has_many :faqs, class_name: "Faq"
  validates :name, presence: true, length: { maximum: 50 }
end