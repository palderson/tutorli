FactoryGirl.define do
  factory :payment do
    association :user
    association :enrolment
    purchased_at {Time.now - 10.days}
    price_cents  500
  end
end

