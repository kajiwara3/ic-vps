# coding: utf-8
class Admin::FaqCategory < ActiveRecord::Base
  validates :name, presence: true, length: {maximum: 50}
end
