# coding: utf-8
class Admin::Base < ApplicationController
  skip_before_filter :record
  layout "admin_application"
  # パンくず設定
  add_crumb 'HOME', "/admin"
end