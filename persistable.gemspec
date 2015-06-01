$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "persistable/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "persistable"
  s.version     = Persistable::VERSION
  s.authors     = ["Shahzad Tariq"]
  s.email       = ["m.shahzad.tariq@hotmail.com"]
  s.homepage    = "http://github.com/mshahzadtariq/persistable"
  s.summary     = "Persist sensitive data by soft delete so you can recover easily whenever required."
  s.description = "Persist sensitive data by soft delete so you can recover easily whenever required."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails"
end
