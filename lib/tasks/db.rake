namespace :db do
 desc "Rebuild the database from scratch"
 task :rebuild => [:environment, :drop, :create, :migrate, :seed, 'test:prepare'] do
   puts "Rebuilding database"
 end

 desc "Fix lessons"
 task :fix_lessons => :environment do
   Course.all.each do |course|
    puts "Fixing lessons for course '#{course.course_name}'"
    course.lessons.each do |lesson|
    end
   end
 end

end