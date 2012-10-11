# coding: utf-8
require 'test_helper'
class FaqCategoryTest < ActiveSupport::TestCase
  test "the truth" do
    assert true
  end

  test "faq_category" do
    faq_category = Factory(:faq_category)
    assert_equal "テストカテゴリ", faq_category.name
  end

  test "presence" do
    faq_category = FaqCategory.new
    assert faq_category.invalid?
    assert faq_category.errors.include?(:name)
  end
end