namespace :admin do
  desc 'Create admin user'
  task :create => :environment do
    user = User.create!(:email => "youremail@admin.com", :password => "1234567", :password_confirmation => "1234567")
    user.confirmed_at = Time.now
    user.admin = true
    user.save!
  end
end