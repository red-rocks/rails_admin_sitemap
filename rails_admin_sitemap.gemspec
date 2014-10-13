$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "rails_admin_sitemap/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "rails_admin_sitemap"
  s.version     = RailsAdminSitemap::VERSION
  s.authors     = ["Alexander Kiseliev"]
  s.email       = ["i43ack@gmail.com"]
  s.homepage    = ""
  s.summary     = "gem sitemap_generator integration in rails_admin"
  s.description = "gem sitemap_generator integration in rails_admin"
  s.license     = "MIT"
  s.homepage    = "https://github.com/ack43/rails_admin_sitemap"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.require_paths = ["lib"]

  s.add_dependency "rails", "~> 4.1.6"
  s.add_dependency "rails_admin"
  s.add_dependency "sitemap_generator"
end
