class ApplicationController < ActionController::Base
  protect_from_forgery
  # ログ保存クラス
  include PartnerLogger
end
