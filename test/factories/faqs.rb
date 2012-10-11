# coding: utf-8
# Read about factories at http://github.com/thoughtbot/factory_girl
FactoryGirl.define do
  factory :faq do
    faq_category { Factory(:faq_category) }
    question "しつもん"
    answer "こたえ"
    tag "タグ"
  end
end
