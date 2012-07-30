module PrivateServersHelper
  include VpsManager
  def domain_state_name(state)
    require_libvirt
    VpsManager::domain_state_name state
  end
end
