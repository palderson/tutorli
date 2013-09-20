# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{rvm}
  s.version = "1.11.3.5"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Wayne E. Seguin", "Michal Papis"]
  s.date = %q{2012-07-02}
  s.description = %q{RVM ~ Ruby Environment Manager ~ Ruby Gem Library.}
  s.email = ["wayneeseguin@gmail.com", "mpapis@gmail.com"]
  s.files = ["History.md", "Manifest.yml", "README.md", "Rakefile", "lib/rvm.rb", "lib/rvm/environment/alias.rb", "lib/rvm/environment/cleanup.rb", "lib/rvm/environment/configuration.rb", "lib/rvm/environment/env.rb", "lib/rvm/environment/gemset.rb", "lib/rvm/environment/info.rb", "lib/rvm/environment/list.rb", "lib/rvm/environment/rubies.rb", "lib/rvm/environment/sets.rb", "lib/rvm/environment/tools.rb", "lib/rvm/environment/utility.rb", "lib/rvm/environment/wrapper.rb", "lib/rvm/environment.rb", "lib/rvm/errors.rb", "lib/rvm/install_command_dumper.rb", "lib/rvm/shell/abstract_wrapper.rb", "lib/rvm/shell/calculate_rvm_path.sh", "lib/rvm/shell/result.rb", "lib/rvm/shell/shell_wrapper.sh", "lib/rvm/shell/single_shot_wrapper.rb", "lib/rvm/shell/utility.rb", "lib/rvm/shell.rb", "lib/rvm/version.rb", "spec/spec_helper.rb"]
  s.homepage = %q{https://rvm.beginrescueend.com/}
  s.licenses = ["MIT"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.6}
  s.summary = %q{RVM Ruby Gem Library}
  s.test_files = ["spec/spec_helper.rb"]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<rake>, [">= 0"])
      s.add_development_dependency(%q<minitest>, [">= 0"])
    else
      s.add_dependency(%q<rake>, [">= 0"])
      s.add_dependency(%q<minitest>, [">= 0"])
    end
  else
    s.add_dependency(%q<rake>, [">= 0"])
    s.add_dependency(%q<minitest>, [">= 0"])
  end
end
