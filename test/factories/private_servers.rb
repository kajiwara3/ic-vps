# coding: utf-8
FactoryGirl.define do
  factory :private_server do
    partner { Factory(:partner) }
    name "サーバー"
    released_at 2.weeks.ago
    expired_at 2.weeks.from_now
  end
end