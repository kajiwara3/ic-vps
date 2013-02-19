# coding: utf-8
class Admin::UserSupportsController < Admin::Base
  before_filter :authenticate_admin_administrator!

  # Toppage
  def show
  end
end
