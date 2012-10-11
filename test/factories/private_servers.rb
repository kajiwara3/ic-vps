# coding: utf-8
FactoryGirl.define do
  factory :private_server do
    partner { Factory(:partner) }
    name "サーバー"
    private_server_code "test_code"
    domain_template_id 1
  end
end