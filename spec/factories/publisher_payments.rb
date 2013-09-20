FactoryGirl.define do
  factory :publisher_payment do
    paid        true
    paid_at     {Time.now - 10.days}
    price_cents 500
  end
end

