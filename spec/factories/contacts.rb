# Read about factories at http://github.com/thoughtbot/factory_girl
# coding: utf-8
FactoryGirl.define do
  factory :contact1, class: Contact do |c|
    c.partner { |partner| partner.association :partner1 }
    c.subject 'contact1'
    c.body 'body des'
    c.contact_status { |status| status.association :contact_status_yet }
  end
end
