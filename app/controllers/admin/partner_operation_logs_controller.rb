class Admin::PartnerOperationLogsController < Admin::Base
  layout "admin_application"

  def index
    @search = PartnerOperationLog.search(params[:q])
    @logs = Kaminari.paginate_array(@search.result.order 'id desc').
                                    page(params[:page]).per(50)
    respond_to do |format|
      format.html
      format.js
    end
  end
end

