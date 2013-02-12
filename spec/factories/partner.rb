# Read about factories at http://github.com/thoughtbot/factory_girl
# coding: utf-8
FactoryGirl.define do
  factory :partner1, class: Partner do |p|
    p.name 'partner1'
    p.name_kana 'partner1'
    p.address 'sagae'
    p.email 'test1@a.jp'
    p.password 'password'
    p.password_confirmation 'password'
  end
end
