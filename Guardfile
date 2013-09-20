# Make sure this guard is ABOVE any other guards using assets such as jasmine-headless-webkit
# It is recommended to make explicit list of assets in `config/application.rb`
# config.assets.precompile = ['application.js', 'application.css', 'all-ie.css']
guard 'rails-assets' do
  watch(%r{^app/assets/.+$})
  watch('config/application.rb')
end

guard 'pow' do
  watch('.powrc')
  watch('.powenv')
  watch('.rvmrc')
  watch('Gemfile')
  watch('Gemfile.lock')
  watch('config/application.rb')
  watch('config/environment.rb')
  watch(%r{^config/environments/.*\.rb$})
  watch(%r{^config/initializers/.*\.rb$})
end

### Guard::Resque
#  available options:
#  - :task (defaults to 'resque:work' if :count is 1; 'resque:workers', otherwise)
#  - :verbose / :vverbose (set them to anything but false to activate their respective modes)
#  - :trace
#  - :queue (defaults to "*")
#  - :count (defaults to 1)
#  - :environment (corresponds to RAILS_ENV for the Resque worker)
guard 'resque', :environment => 'development' do
  watch(%r{^app/(.+)\.rb$})
  watch(%r{^lib/(.+)\.rb$})
end

guard 'bundler' do
  watch('Gemfile')
end

### Guard::Resque
#  available options:
#  - :task (defaults to 'resque:work' if :count is 1; 'resque:workers', otherwise)
#  - :verbose / :vverbose (set them to anything but false to activate their respective modes)
#  - :trace
#  - :queue (defaults to "*")
#  - :count (defaults to 1)
#  - :environment (corresponds to RAILS_ENV for the Resque worker)
guard 'resque', :environment => 'development' do
  watch(%r{^app/(.+)\.rb$})
  watch(%r{^lib/(.+)\.rb$})
end

guard 'spork', :rspec_env => { 'RAILS_ENV' => 'test' } do
  watch('config/application.rb')
  watch('config/environment.rb')
  watch('config/environments/test.rb')
  watch(%r{^config/initializers/.+\.rb$})
  watch('Gemfile')
  watch('Gemfile.lock')
  watch('spec/spec_helper.rb') { :rspec }
  watch('test/test_helper.rb') { :test_unit }
  watch(%r{features/support/}) { :cucumber }
  watch(%r{^spec/factories/(.+)\.rb})
end

guard 'rspec', :cli => "--drb" do
  watch(%r{^spec/.+_spec\.rb$})
  watch(%r{^lib/(.+)\.rb$})     { |m| "spec/lib/#{m[1]}_spec.rb" }
  watch('spec/spec_helper.rb')  { "spec" }
  watch(%r{^spec/factories/(.+)\.rb}) { "spec" }

  # Rails example
  watch(%r{^app/(.+)\.rb$})                           { |m| "spec/#{m[1]}_spec.rb" }
  watch(%r{^app/(.*)(\.erb|\.haml)$})                 { |m| "spec/#{m[1]}#{m[2]}_spec.rb" }
  watch(%r{^app/controllers/(.+)_(controller)\.rb$})  { |m| ["spec/routing/#{m[1]}_routing_spec.rb", "spec/#{m[2]}s/#{m[1]}_#{m[2]}_spec.rb", "spec/acceptance/#{m[1]}_spec.rb"] }
  watch(%r{^spec/support/(.+)\.rb$})                  { "spec" }
  watch('config/routes.rb')                           { "spec/routing" }
  watch('app/controllers/application_controller.rb')  { "spec/controllers" }
  # Capybara request specs
  watch(%r{^app/views/(.+)/.*\.(erb|haml)$})          { |m| "spec/requests/#{m[1]}_spec.rb" }
end

