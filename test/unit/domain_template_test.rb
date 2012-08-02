require 'test_helper'

class DomainTemplateTest < ActiveSupport::TestCase
  test "presence" do
    domain_template = DomainTemplate.new
    assert domain_template.invalid?
    assert domain_template.errors.include?(:name)
  end
end
