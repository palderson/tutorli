class PaymentsController < ApplicationController
  before_filter :authenticate_user!

  def index
    @payments = current_user.payments.all
  end

  def publisher_payments
    @payments = current_user.potential_payments.all
    @publisher_payments = current_user.publisher_payments.all
  end
end
