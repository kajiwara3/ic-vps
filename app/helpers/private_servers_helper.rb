# coding: utf-8
module PrivateServersHelper
  include VpsManager
  def state_name(domain_name)
    domain_state_name_via_domain_name(domain_name)
  end
end
