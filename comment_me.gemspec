$:.push File.expand_path("lib", __dir__)

# Maintain your gem's version:
require "comment_me/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |spec|
  spec.name        = "comment_me"
  spec.version     = CommentMe::VERSION
  spec.authors     = ["Armando Alejandre"]
  spec.email       = ["armando1339@gmail.com"]
  spec.homepage    = ""
  spec.summary     = "Attached comments for ActiveRecord models"
  spec.description = "Attached comments for ActiveRecord models"
  spec.license     = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "https://rubygems.org"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  spec.add_dependency "rails", "~> 5.2.2", ">= 5.2.2.1"

  spec.add_development_dependency "pg"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "jbuilder"
  spec.add_development_dependency "rspec-rails"
  spec.add_development_dependency "shoulda-matchers"
  spec.add_development_dependency "shoulda-callback-matchers"
  spec.add_development_dependency "coveralls"
  spec.add_development_dependency "pry"
end
