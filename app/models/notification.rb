# coding: utf-8
class Notification < ActiveRecord::Base
  scope :readable,
    ->{ now = Date.today
        where("released_at <= ? AND (? <= expired_at OR " + "expired_at IS NULL)", now, now).order("released_at desc") }
end
