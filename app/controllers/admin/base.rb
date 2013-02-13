# coding: utf-8
class Admin::Base < ApplicationController
  #before_filter :authorize
  #before_filter :admin_login_required
  before_filter :authenticate_admin_administrator!
  skip_before_filter :record
  layout "admin_application"
  # パンくず設定
  add_crumb 'HOME', "/admin"
end