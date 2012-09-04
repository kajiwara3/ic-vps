class Admin::TopController < Admin::Base
  skip_before_filter :admin_login_required
  layout "admin_application"

  #indexアクション
  def index
# ログイン画面にはレイアウトを使わない
#        render layout: false if @current_administrator.blank?
  end
end
