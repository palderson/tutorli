require 'spec_helper'

describe User do
  before do
    @user = User.create!(:username => "fred01", :email => "fred@example.com", :password => "123456")
    @course = Course.new(:course_name => "name", :course_overview => "test", :tutor_bio => "something", :expected_results => "something", :price => 5)
    @course.category = Category.create! :name => 'something'
    @course.save!
  end
  # describe 'with invalid username' do
  #   it 'throws an error' do
  #     @user.username = nil
  #     lambda {@user.save!}.should raise_error
  #   end
  # end 
  # 
  describe 'with no email' do
    it 'throws an error' do
      @user.email = nil
      lambda {@user.save!}.should raise_error
    end
  end 

  describe 'with bad email' do
    it 'throws an error' do
      ['xxx','fish_banana_!@%*&^%$#', ''].each do |email|
        @user.email = email
        lambda {@user.save!}.should raise_error
      end
    end
  end 
  
  # describe 'with no password' do
  #   it 'throws an error' do
  #     @user.password = nil
  #     lambda {@user.save!}.should raise_error
  #   end
  # end
  
  # describe 'with course enrollment' do
  #   it 'is retrievable' do
  #     @user.enrol_in_course(@course)
  #     @user.courses.should include @course
  #   end
  # end
  
  describe 'with published course' do
    it 'is retrievable' do
      @user.publish(@course)
      @user.published_courses.should include @course
    end
  end
end