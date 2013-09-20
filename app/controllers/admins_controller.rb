class AdminsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :must_be_admin
  
  def index
    @is_owed = User.all
    @courses = Course.all
    
    # publishers = User.all
    # @is_owed = publishers.select {|publisher| publisher.amount_owed > Payment::THRESHOLD_AMOUNT}
  end
  
  def pay_publisher    
    publisher = User.find(params[:id])
    publisher.pay_publisher if publisher
    @is_owed = User.all

    respond_to do |format|
      format.html
      format.js
    end
  end
  
  private
  
  def must_be_admin
    unless current_user && current_user.admin
      redirect_to "/"
    end
  end
end
