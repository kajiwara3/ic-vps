class ApplicationController < ActionController::Base
#  protect_from_forgery
#  before_filter :authorize

  class Forbidden < StandardError; end

  private
  def authorize
    if session[:pertner_id]
      @current_pertner = Pertner.find_by_id(session[:pertner_id])
      session.delete(:pertner_id) unless @current_pertner
    end
  end

  def login_required
    raise Forbidden unless @current_pertner
  end

end
