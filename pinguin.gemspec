$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "pinguin/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "pinguin"
  s.version     = Pinguin::VERSION
  s.authors     = ["TODO: Your name"]
  s.email       = ["TODO: Your email"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of Pinguin."
  s.description = "TODO: Description of Pinguin."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", "~> 3.2.8" #TODO: remove this
  s.add_dependency "thor"
  s.add_dependency "rack"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency "rspec-rails" 
end
