$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "sitebootstrapperv2/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "sitebootstrapperv2"
  s.version     = Sitebootstrapperv2::VERSION
  s.authors     = ["TODO: Your name"]
  s.email       = ["TODO: Your email"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of Sitebootstrapperv2."
  s.description = "TODO: Description of Sitebootstrapperv2."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 3.1.1"
  s.add_dependency "devise"
  s.add_dependency "omniauth", "~> 1.0"
  s.add_dependency "omniauth-facebook"
  s.add_dependency "omniauth-twitter"
  s.add_dependency "omniauth-google-oauth2"
  # s.add_dependency "jquery-rails"

  s.add_development_dependency "mysql2"
end
