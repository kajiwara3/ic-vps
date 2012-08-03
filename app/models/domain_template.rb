# coding: utf-8
class DomainTemplate < ActiveRecord::Base
  attr_accessible :name, :xml_data
  validates :name, presence: true, length: { maximum: 50 }
  validates :xml_data, presence: { on: :create }
end