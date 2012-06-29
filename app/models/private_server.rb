class PrivateServer < ActiveRecord::Base
  belongs_to :partner
  attr_accessible :partner_id, :name, :released_at, :expired_at, :memo

  scope :active_server,
    ->{ now = Time.current
        where("released_at <= ? AND (? < expired_at OR " +
               "expired_at IS NULL)", now, now) }

end
