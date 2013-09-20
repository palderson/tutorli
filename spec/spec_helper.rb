require 'rubygems'
require 'spork'
require 'factory_girl'
require 'devise'
require 'capybara/rspec'

module ControllerMacros
  def login_admin
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:admin]
      sign_in Factory.create(:admin)
    end
  end

  def login_user
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      user = Factory.create(:user)
      # user.confirm! # or set a confirmed_at inside the factory. Only necessary if you are using the confirmable module
      sign_in user
    end
  end
end

Spork.prefork do
  require File.expand_path("../../config/environment", __FILE__)
  require 'rspec/rails'
  require 'rspec/autorun'
  require 'factory_girl'
  require 'factory_girl_rails'
  
  Rails.env ||= 'test'
  SPEC_SUPPORT = File.expand_path(File.join(File.dirname(__FILE__), "support"))
  $: << SPEC_SUPPORT
  
  Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| require f}

  RSpec.configure do |config|
    config.mock_with :rspec
    config.use_transactional_fixtures = true
    config.infer_base_class_for_anonymous_controllers = false
    config.include Devise::TestHelpers, :type => :controller
    config.extend ControllerMacros, :type => :controller
  end
end

Spork.each_run do
  require 'simplecov'
  SimpleCov.start
  require 'factory_girl_rails'
  
  Tutorli::Application.reload_routes!
  FactoryGirl.reload
  
  Dir[Rails.root.join("lib/**/*.rb")].each do |f|
    require f
  end
  
  Dir[Rails.root.join("app/models/*.rb")].each do |f|
    load f
  end
end
