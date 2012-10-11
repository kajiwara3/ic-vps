# coding: utf-8
require 'test_helper'

class PertnerTest < ActiveSupport::TestCase
  test "the truth" do
    assert true
  end

  test "factry girl" do
    partner = Factory(:partner)
    assert_equal "Taro1", partner.name
  end

  test "presence" do
    partner = Partner.new
    assert partner.invalid?
    assert partner.errors.include?(:name)
    assert partner.errors.include?(:email)
    assert partner.errors.include?(:name_kana)
    assert partner.errors.include?(:address)
    assert partner.errors.include?(:password)
  end

  test "name length 51" do
    partner = Partner.new({
      name: "あああああああああああああああああああああああああああああああああああああああああああああああああああ",
      email: "test@a.com",
      name_kana: "aaa",
      address: "あああああ",
      password: "pass"
    })
    partner.save
    assert partner.errors.include?(:name)
  end
end