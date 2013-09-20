class ApplicationController < ActionController::Base
  before_filter :sidebar_info
  protect_from_forgery
  
  def sidebar_info
    @categories = Category.all
    @levels = Level.all
    @prices = Course.prices_for_display
  end
end
