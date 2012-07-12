# coding: utf-8

module VpsManager
  # ハイパーバーザーのコネクションを取得する
  def open_hypervisor_connection
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

  # 指定したドメイン名に該当するドメインのインスタンスを起動する。
  def start_up_domain(domain_name)
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
