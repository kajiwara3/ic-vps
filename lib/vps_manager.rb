# coding: utf-8

module VpsManager
  def list_vps
    logger.debug('========================= 1')
    begin
      require 'libvirt'
      url = "qemu+tcp://root@192.168.0.140:16509/system"
      logger.debug('========================= 2')
      conn = Libvirt::open(url)
      puts conn.list_defined_domains;

      logger.debug('========================= 3')
    rescue => e
    logger.debug('========================= 4')
      raise e.class, "#{e.message} -> piyo ", e.backtrace
    end
#    puts conn.list_defined_domains;
  end
end
