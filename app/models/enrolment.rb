class Enrolment < ActiveRecord::Base
  belongs_to :user
  belongs_to :course

  attr_accessor :stripe_card_token

  OUR_COMMISSION = 0.2
  TRANSACTION_FEE = Money.new(30)
  STRIPE_COMMISSION = 0.029

  def save_with_payment(is_test = false)
    Rails.logger.debug "save_with_payment(#{is_test})"
    price = course.price.cents
    Rails.logger.debug "Course price is $#{price}"
    Rails.logger.debug "stripe_card_token = '#{stripe_card_token}'"
    if valid?
      unless is_test
        begin
          charge =  Stripe::Charge.create(
            :amount => price,
            :currency => "usd",
            :card => stripe_card_token,
            :description => "#{user.email} enrolled in course #{course.course_name}"
          )
          self.stripe_charge_id = charge.id
        rescue Stripe::InvalidRequestError => e
          Rails.logger.debug "Stripe error while creating charge: #{e.message}"
          errors.add :base, "There was a problem with your credit card."
          false
        end
      else
        self.stripe_charge_id = "ABCD123"
      end
      payment_from_user(Money.new(price))
      self.save!
    end
  end

  def payment_from_user(price)
    Rails.logger.debug "payment_from_user(#{price})"
    payment = Payment.new(:price => price, :publisher_price => less_commision(price))
    payment.enrolment = self
    payment.publisher = course.publisher
    payment.user = self.user
    payment.purchased_at = Time.now
    payment.save!
  end

  def less_commision(price)
    stripe_commission = price * STRIPE_COMMISSION + TRANSACTION_FEE
    our_commission = price * OUR_COMMISSION
    price - our_commission - stripe_commission
  end
end
