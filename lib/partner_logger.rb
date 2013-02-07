# coding: utf-8
module PartnerLogger
  def record partner
    @partner_operation_log = PartnerOperationLog.new(partner_id: partner.id,
                                                     url: request.requeest_uri,
                                                     ip_address: request.remote_ip,
                                                     useragent: request.env["HTTP_USER_AGENT"]
                                                    );
  end
end