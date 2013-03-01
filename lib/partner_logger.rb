# coding: utf-8
module PartnerLogger
  def record
    return if current_partner.nil?
    @partner_operation_log = PartnerOperationLog.new(partner_id: current_partner.id,
                                                     url: request.fullpath,
                                                     ip_address: request.remote_ip,
                                                     useragent: request.env["HTTP_USER_AGENT"],
                                                     request_method: request.env["REQUEST_METHOD"]
                                                    );
    @partner_operation_log.save
  end
end