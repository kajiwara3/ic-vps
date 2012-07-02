# coding: utf-8
FactoryGirl.define do
  factory :partner do
    sequence(:name) { |n| "Taro#{n}" }
    sequence(:email) { |n| "taro#{n}@a.com" }
    sequence(:name_kana) { |n| "Yamada Taro#{n}" }
    sequence(:address) { |n| "寒河江#{n}" }
    password "password"
    password_confirmation "password"
  end
end