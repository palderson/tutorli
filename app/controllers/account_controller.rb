class AccountController < ApplicationController
  before_filter :authenticate_user!
  def index
    @user = current_user
  end
  
  def update
    @user = current_user
    if @user.update_attributes(params[:user])
      redirect_to publisher_payments_payments_path, notice: 'Account was successfully updated.'
    else
      render action: "index"
    end
  end
end
