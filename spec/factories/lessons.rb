FactoryGirl.define do
  factory :lesson do
    lesson_number   0
    position        0
    lesson_practical 'A practical thing to do.'
    lesson_name     'Do something excellent.'
    lesson_overview 'An overview of this lesson.'
    exercises       {FactoryGirl.create_list(:exercise, 3)}
  end
end

