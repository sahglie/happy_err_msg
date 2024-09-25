require_relative "lib/happy_err_msg/version"

Gem::Specification.new do |spec|
  spec.name        = "happy_err_msg"
  spec.version     = HappyErrMsg::VERSION
  spec.authors     = ["sahglie"]
  spec.email       = ["sahglie@hey.com"]
  spec.summary     = "Lets you specify error messages without the attribute name"
  spec.description = "Lets you specify error messages without the attribute name"
  spec.license     = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  # spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  # spec.metadata["homepage_uri"] = spec.homepage
  # spec.metadata["source_code_uri"] = "TODO: Put your gem's public repo URL here."
  # spec.metadata["changelog_uri"] = "TODO: Put your gem's CHANGELOG.md URL here."

  spec.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  spec.add_dependency "rails", ">= 6.1.3.2", "<= 8.0"
  spec.add_development_dependency "active_attr"
end
