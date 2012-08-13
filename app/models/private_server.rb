# coding: utf-8
class PrivateServer < ActiveRecord::Base
  belongs_to :partner
  attr_accessible :partner_id, :private_server_code, :tag, :name, :memo

  scope :active_server,
    ->{ now = Time.current
        where("released_at <= ? AND (? < expired_at OR " +
               "expired_at IS NULL)", now, now) }

  # ドメインステータス名：「起動中」
  LIBVIRT_DOMAIN_STATE_NAME_RUNNING = '稼働中'
  # ドメインステータス名：「停止中」
  LIBVIRT_DOMAIN_STATE_NAME_SHUTOFF = '停止中'
  # ドメインステータス名：「不明」
  LIBVIRT_DOMAIN_STATE_NAME_UNKNOWN = '状態を取得できません'
end
