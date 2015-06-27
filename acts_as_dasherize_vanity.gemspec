# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'acts_as_dasherize_vanity/version'

Gem::Specification.new do |spec|
  spec.name          = "acts_as_dasherize_vanity"
  spec.version       = ActsAsDasherizeVanity::VERSION
  spec.authors       = ["Vinay Sanker"]
  spec.email         = ["vinaytech09@gmail.com"]

  spec.summary       = "A gem adding to an active_record model for dasherize vanity url, allowing it to act as dasherize vanity"
  spec.description   = 'This "acts_as" extension provides the capabilities a application to allow to generate meaning ful urls for SEO perpose.'
  spec.homepage      = "https://rubygems.org/gems/acts_as_dasherize_vanity"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  #if spec.respond_to?(:metadata)
  #  spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com' to prevent pushes to rubygems.org, or delete to allow pushes to any server."
  #end

  spec.add_development_dependency "bundler", "~> 1.9"
  spec.add_development_dependency "rake", "~> 10.0"  
  spec.add_development_dependency "ruby", "~> 2.0.0"  
end
