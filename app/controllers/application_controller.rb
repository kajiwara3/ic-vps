class ApplicationController < ActionController::Base
#  protect_from_forgery
#  before_filter :authorize

  class Forbidden < StandardError; end

  private
  def authorize
    if session[:partner_id]
        @current_partner = Partner.find_by_id(session[:partner_id])
      session.delete(:partner_id) unless @current_partner
    end
  end

  def login_required
    raise Forbidden unless @current_partner
  end

end
