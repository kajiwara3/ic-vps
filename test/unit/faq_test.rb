# coding: utf-8
require 'test_helper'
class FaqTest < ActiveSupport::TestCase
  test "the truth" do
    assert true
  end

  test "faq_question" do
    faq = Factory(:faq)
    assert_equal "しつもん", faq.question
  end

  test "faq_qnswer" do
    faq = Factory(:faq)
    assert_equal "こたえ", faq.answer
  end

  test "faq validate presence" do
    faq = Faq.new
    assert faq.invalid?
    assert faq.errors.include?(:question)
    assert faq.errors.include?(:answer)
    assert_nil faq.errors.include?(:tag)
  end
end
