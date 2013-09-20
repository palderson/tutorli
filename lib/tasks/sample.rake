namespace :sample do
  desc 'Randomize published flag'
  task :publish => :environment do
    Course.all.each do |course|
      val = rand(2).to_i == 0
      puts "#{course.course_name}: #{val}"
      course.published = val
      course.save!
    end
  end

  desc 'Delete data'
  task :delete => :environment do
    Course.destroy_all
    Payment.destroy_all
    Enrolment.destroy_all
    PublisherPayment.destroy_all
  end

  desc 'Create users, courses and lessons'
  task :create => :environment do
    puts "deleting Users"
    User.destroy_all
    puts "deleting Courses"
    Course.destroy_all
    puts "deleting Enrolments"
    Enrolment.destroy_all
    puts "deleting Payments"
    Payment.destroy_all
    puts "deleting PublisherPayments"
    PublisherPayment.destroy_all

    %w(David Peter Fred Bill George).each do |name|
      user = User.where(:username => name).first_or_create!(:email => "#{name}@example.com", :password => "1234567", :password_confirmation => "1234567")
      user.confirmed_at = Time.now.utc - 10.days
      user.admin = true
      user.save!
      puts "Created user '#{name}'"
    end

    30.times do |index|
      course = Course.new(:course_name => "Course #{index}",
        :course_overview => "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque sagittis egestas tristique. Aliquam placerat tempus tellus, vel sollicitudin est tempus sed. Maecenas imperdiet facilisis neque. Maecenas aliquam, neque eu ultricies vestibulum, velit mauris pulvinar nisl, ut dignissim ipsum magna id dui. Integer a tortor vitae lectus sodales dignissim. Mauris placerat augue pellentesque, hendrerit mi ac, interdum arcu. Donec auctor et arcu ac ornare. Vivamus blandit venenatis eros in dignissim.<br>Cras ac elementum tortor, eget placerat arcu. Mauris quam eros, laoreet eget enim sed, venenatis gravida lorem. Nulla eu pulvinar nisi. Vestibulum facilisis turpis sed est adipiscing porttitor. Aliquam tincidunt nec leo nec ornare. Etiam nec hendrerit mi. Morbi vitae turpis at erat lacinia ultricies vitae eu massa. Proin lorem eros, bibendum vel nisi et, congue gravida nunc. Duis tempor eros id arcu rutrum dapibus.",
        :tutor_bio => "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque sagittis egestas tristique. Aliquam placerat tempus tellus, vel sollicitudin est tempus sed. Maecenas imperdiet facilisis neque. Maecenas aliquam, neque eu ultricies vestibulum, velit mauris pulvinar nisl, ut dignissim ipsum magna id dui. Integer a tortor vitae lectus sodales dignissim. Mauris placerat augue pellentesque, hendrerit mi ac, interdum arcu. Donec auctor et arcu ac ornare. Vivamus blandit venenatis eros in dignissim.<br>Cras ac elementum tortor, eget placerat arcu. Mauris quam eros, laoreet eget enim sed, venenatis gravida lorem. Nulla eu pulvinar nisi. Vestibulum facilisis turpis sed est adipiscing porttitor. Aliquam tincidunt nec leo nec ornare. Etiam nec hendrerit mi. Morbi vitae turpis at erat lacinia ultricies vitae eu massa. Proin lorem eros, bibendum vel nisi et, congue gravida nunc. Duis tempor eros id arcu rutrum dapibus.",
        :expected_results => "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque sagittis egestas tristique. Aliquam placerat tempus tellus, vel sollicitudin est tempus sed. Maecenas imperdiet facilisis neque. Maecenas aliquam, neque eu ultricies vestibulum, velit mauris pulvinar nisl, ut dignissim ipsum magna id dui. Integer a tortor vitae lectus sodales dignissim. Mauris placerat augue pellentesque, hendrerit mi ac, interdum arcu. Donec auctor et arcu ac ornare. Vivamus blandit venenatis eros in dignissim.<br>Cras ac elementum tortor, eget placerat arcu. Mauris quam eros, laoreet eget enim sed, venenatis gravida lorem. Nulla eu pulvinar nisi. Vestibulum facilisis turpis sed est adipiscing porttitor. Aliquam tincidunt nec leo nec ornare. Etiam nec hendrerit mi. Morbi vitae turpis at erat lacinia ultricies vitae eu massa. Proin lorem eros, bibendum vel nisi et, congue gravida nunc. Duis tempor eros id arcu rutrum dapibus.",
        :level_id => "2")

      course.price = 5
      course.level = Level.all.sample
      course.category = Category.all.sample
      course.publisher = User.all.sample
      course.published = (rand(2).to_i == 0)
      course.save!

      puts course.inspect

      3.times do |lesson_index|
        lesson = course.lessons.build(
          :lesson_name => "Lesson #{lesson_index}",
          :lesson_overview => "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque sagittis egestas tristique. Aliquam placerat tempus tellus, vel sollicitudin est tempus sed. Maecenas imperdiet facilisis neque. Maecenas aliquam, neque eu ultricies vestibulum, velit mauris pulvinar nisl, ut dignissim ipsum magna id dui. Integer a tortor vitae lectus sodales dignissim. Mauris placerat augue pellentesque, hendrerit mi ac, interdum arcu. Donec auctor et arcu ac ornare. Vivamus blandit venenatis eros in dignissim.<br>Cras ac elementum tortor, eget placerat arcu. Mauris quam eros, laoreet eget enim sed, venenatis gravida lorem. Nulla eu pulvinar nisi. Vestibulum facilisis turpis sed est adipiscing porttitor. Aliquam tincidunt nec leo nec ornare. Etiam nec hendrerit mi. Morbi vitae turpis at erat lacinia ultricies vitae eu massa. Proin lorem eros, bibendum vel nisi et, congue gravida nunc. Duis tempor eros id arcu rutrum dapibus.",
          :lesson_practical => "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque sagittis egestas tristique. Aliquam placerat tempus tellus, vel sollicitudin est tempus sed. Maecenas imperdiet facilisis neque. Maecenas aliquam, neque eu ultricies vestibulum, velit mauris pulvinar nisl, ut dignissim ipsum magna id dui. Integer a tortor vitae lectus sodales dignissim. Mauris placerat augue pellentesque, hendrerit mi ac, interdum arcu. Donec auctor et arcu ac ornare. Vivamus blandit venenatis eros in dignissim.<br>Cras ac elementum tortor, eget placerat arcu. Mauris quam eros, laoreet eget enim sed, venenatis gravida lorem. Nulla eu pulvinar nisi. Vestibulum facilisis turpis sed est adipiscing porttitor. Aliquam tincidunt nec leo nec ornare. Etiam nec hendrerit mi. Morbi vitae turpis at erat lacinia ultricies vitae eu massa. Proin lorem eros, bibendum vel nisi et, congue gravida nunc. Duis tempor eros id arcu rutrum dapibus.",)
        lesson.save!
        puts lesson.inspect
      end

      user = User.all.sample
      user.enrol_in_course(course, true) if course.published && !user.enrolments.include?(course)
    end

    User.all.each do |user|
      user.pay_publisher
      puts "paid publisher #{user.email}"
    end

  end

  desc 'Pay everyone'
  task :pay => :environment do
    User.all.each do |user|
      user.pay_publisher
      puts "paid publisher #{user.email}"
    end
  end

  desc 'Make some more enrolments'
  task :more_enrolments => :environment do
    100.times do |index|
      User.all.sample.enrol_in_course(Course.all.sample, true)
    end
  end
end
