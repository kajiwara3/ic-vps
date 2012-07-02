#coding: utf-8
require 'test_helper'

class PrivateServerTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "private_server" do
    private_server = Factory(:private_server)
    assert_equal "サーバー", private_server.name
  end
end
