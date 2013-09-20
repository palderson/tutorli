FactoryGirl.define do
  factory :course do
    course_name       'Sample course'
    course_overview   'An overview of what the course is about.'
    tutor_bio         'This guy is amazing.'
    expected_results  'All sorts of impressive things.'
    number_of_lessons 3
    level             {FactoryGirl.create(:level)}
    price_cents       500
    category          {FactoryGirl.create(:category)}
    publisher         {FactoryGirl.create(:user)}
    lessons           {FactoryGirl.create_list(:lesson, 3)}
  end
end



