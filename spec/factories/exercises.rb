FactoryGirl.define do
  factory :exercise do
    multiple_choice_question  false
    written_question          'This is a question.'
    practical_exercise        'Do something practical.'
  end
end

