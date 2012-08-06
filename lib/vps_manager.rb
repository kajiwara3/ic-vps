# coding: utf-8
module VpsManager
  def get_domain_state_list
    require_libvirt
    domain_state_list = {
      Libvirt::Domain::RUNNING => PrivateServer::LIBVIRT_DOMAIN_STATE_NAME_RUNNING,
      Libvirt::Domain::SHUTOFF => PrivateServer::LIBVIRT_DOMAIN_STATE_NAME_SHUTOFF
    }
  end

  def domain_state_name_via_domain_name(domain_name)
    require_libvirt
    domain = get_domain_connection_by_name(domain_name)
    domain_state_name domain.info.state
  end

  # 与えられたドメインのステータスに該当する日本語名を返します。
  def domain_state_name(state)
    domain_state_list = get_domain_state_list
    domain_state_list[state]
  end

  # ハイパーバーザーのコネクションを取得する
  def open_hypervisor_connection
    require_libvirt
    url = IcVps::Application.config.hypervisor_uri
    conn = Libvirt::open(url)
  end

  # 起動中のドメインの一覧を取得して返します。
  def active_vps_list
    require_libvirt
    begin
      conn = open_hypervisor_connection
      active_domain_list = conn.list_domains
      domain_name_list = []
      active_domain_list.each do |domain_id|
        domain = conn.lookup_domain_by_id domain_id
        domain_name_list << domain.name
      end
      return domain_name_list
    rescue => e
      conn.close
      raise e.class, e.message, e.backtrace
    end
  end

  # 停止中のドメインの一覧を取得して返します。
  def list_vps
    begin
      require_libvirt
      conn = open_hypervisor_connection
      defined_domain_list = conn.list_defined_domains;
      conn.close
      defined_domain_list
    rescue => e
      conn.close
      raise e.class, e.message, e.backtrace
    end
  end

  # 指定したドメイン名に該当するドメインのコネクションインスタンスを取得して返します。
  def get_domain_connection_by_name(domain_name)
    require_libvirt
    begin
      conn = open_hypervisor_connection
      conn.lookup_domain_by_name(domain_name)
    rescue => e
      raise e.class, e.message, e.backtrace
    end
  end

  # 指定したドメインが起動中であるかを返します。
  def domain_running?(domain)
    require_libvirt
    if domain.info.state == Libvirt::Domain::RUNNING
      return true
    end
    return false
  end

  # 指定したドメイン名に該当するドメインのインスタンスを起動する。
  def startup(domain)
    require_libvirt
    begin
      logger.debug("==================== domain state is: #{domain.info.state}")
      domain.create unless domain_running? domain
    rescue => e
      logger.debug("==================== expection raise")
      raise e.class, e.message, e.backtrace
    end
  end

  # 指定したドメインのインスタンスをシャットダウンします。
  def shutdown(domain)
    require_libvirt
    begin
      logger.debug("==================== domain state is: #{domain.info.state}")
      domain.shutdown if domain_running? domain
    rescue => e
      logger.debug("==================== expection raise")
      raise e.class, e.message, e.backtrace
    end
  end

  # 指定したドメイン名に該当するドメインを取得し、正式名を返す。
  def get_domain_name(domain_name)
    require_libvirt
    conn = open_hypervisor_connection
    domain = conn.lookup_domain_by_name(domain_name)
    domain.name
  end

  # ruby_libvirtを読み込む
  def require_libvirt
    require 'libvirt'
  end
end
