FactoryGirl.define do
  factory :enrolment do
    association :user
    association :course
  end
end



