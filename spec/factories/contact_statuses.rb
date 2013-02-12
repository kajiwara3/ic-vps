# Read about factories at http://github.com/thoughtbot/factory_girl
# coding: utf-8
FactoryGirl.define do
  factory :contact_status_yet, class: ContactStatus do |c|
    c.name 'yet'
    c.contact_status_code '1'
  end
end
