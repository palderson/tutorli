FactoryGirl.define do
  sequence :email do |n|
    "user_#{n}@example.com"
  end
  
  factory :user do
    email       {FactoryGirl.generate(:email)}
    password    "bananafish32"
    password_confirmation {|u| u.password}
    confirmed_at  {Time.now - 10.days}
  end
end



