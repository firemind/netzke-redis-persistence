$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "./lib/netzke_redis_persistence/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "netzke-redis-persistence"
  s.version     = NetzkeRedisPersistence::VERSION
  s.license     = 'MIT'
  s.authors     = ["firemind"]
  s.email       = ["mike@otep.ch"]
  s.homepage    = "https://github.com/firemind/netzke-redis-persistence"
  s.summary     = "Gem to store netzke persistence values in redis store."
  s.description = "Overrides the persistence store for netzke to store configuration values persistent in redis scoped by users id."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["LICENSE", "Rakefile", "README.md", "init.rb"]
  s.test_files = Dir["test/**/*"]
  s.require_paths = ["lib"]

  s.add_dependency "rails", "~> 3.2.14"
  s.add_dependency "netzke-core", "> 0.8.0"
  s.add_dependency "redis", "~> 3.0.4"

  s.add_development_dependency "sqlite3"
end
