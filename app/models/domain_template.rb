# coding: utf-8
class DomainTemplate < ActiveRecord::Base
  validates :name, presence: true, length: { maximum: 50 }
  validates :xml_data, presence: true
end
