module PaymentsHelper
  def outstanding_payments
    amount = current_user.amount_owed
    humanized_money_with_symbol(Money.new(amount))
  end
  
  def lifetime_earnings
    amount = current_user.publisher_payments.sum(:price_cents)
    humanized_money_with_symbol(Money.new(amount))
  end
  
  def next_payment_date
    amount = current_user.amount_owed
    if amount >= Payment::THRESHOLD_AMOUNT
      now = Time.now
      short_date(Time.new(now.year, now.month, 1) + 1.month)
    else
      "NA"
    end
  end
  
  def next_payment_total
    amount = current_user.amount_owed
    if amount >= Payment::THRESHOLD_AMOUNT
      humanized_money_with_symbol(Money.new(amount))
    else
      "NA"
    end
  end
  
end
