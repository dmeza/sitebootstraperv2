$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "sitebootstrapperv2/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "sitebootstrapperv2"
  s.version     = Sitebootstrapperv2::VERSION
  s.authors     = ["Gustavo Gonzalez"]
  s.email       = ["gustavo@martintechlabs.com"]
  s.homepage    = "https://github.com/martintechlabs/sitebootstrapperv2"
  s.summary     = ""
  s.description = ""

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 3.2.0"
  s.add_dependency "devise"
  s.add_dependency "omniauth", "~> 1.0"
  s.add_dependency "omniauth-facebook"
  s.add_dependency "omniauth-twitter"
  s.add_dependency "omniauth-openid"
  s.add_dependency "omniauth-google-oauth2"
  s.add_dependency "paperclip", "2.4.2" if RUBY_VERSION == "1.8.7"
  s.add_dependency "paperclip" unless RUBY_VERSION == "1.8.7"
  s.add_dependency "haml"
  s.add_dependency "will_paginate"
  # s.add_dependency "jquery-rails"

  s.add_development_dependency "mysql2"
end
