class UserSupportsController < ApplicationController
  before_filter :authenticate_partner!

  def show
  end
end
