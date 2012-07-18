# coding: utf-8

module VpsManager
  # ハイパーバーザーのコネクションを取得する
  def open_hypervisor_connection
    require_libvirt
    url = IcVps::Application.config.hypervisor_uri
    conn = Libvirt::open(url)
  end

  # ハイパーバイザーに登録されているドメインの一覧を取得して表示する。
  def list_vps
    begin
      require_libvirt
      conn = open_hypervisor_connection
      logger.debug "================ After open, connection closed?: #{conn.closed?}"
      domain_list = conn.list_defined_domains;
      conn.close
      logger.debug "================ After open, connection closed?: #{conn.closed?}"
      domain_list
    rescue => e
      conn.close
      raise e.class, "#{e.message} -> piyo ", e.backtrace
    end
#    puts conn.list_defined_domains;
  end

  # 指定したドメイン名に該当するドメインのコネクションインスタンスを取得して返します。
  def get_domain_connection_by_name(domain_name)
    requre_libvirt
    begin
      conn == conn.lookup_domain_by_name(domain_name)
    rescue => e
      raise e.class, "#{e.message}", e.backtrace
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
  def startup_domain(domain)
    require_libvirt
    domain.create unless domain_running? domain
  end

  # 指定したドメインのインスタンスをシャットダウンします。
  def shutdown_domain(domain)
    requre_libvirt
    domain.shutdown
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