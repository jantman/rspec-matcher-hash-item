# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rspec_matcher_hash_item/version'

Gem::Specification.new do |spec|
  spec.name          = "rspec-matcher-hash-item"
  spec.version       = RspecMatcherHashItem::VERSION
  spec.authors       = ["Jason Antman"]
  spec.email         = ["jason@jasonantman.com"]
  spec.summary       = %q{Rspec matchers for dealing with hashes and their content.}
  spec.homepage      = "https://github.com/jantman/rspec-matcher-hash-item"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]
  spec.add_dependency 'rspec', '>= 3.0'
  
  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
end
