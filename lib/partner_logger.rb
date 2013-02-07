# coding: utf-8
module PartnerLogger
  def record
    @partner_operation_log = PartnerOperationLog.new(partner_id: current_partner.id,
                                                     url: request.fullpath,
                                                     ip_address: request.remote_ip,
                                                     useragent: request.env["HTTP_USER_AGENT"],
                                                     request_method: request.env["REQUEST_METHOD"]
                                                    );
    @partner_operation_log.save
  end
end