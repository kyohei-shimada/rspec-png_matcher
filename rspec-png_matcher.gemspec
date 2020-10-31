# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rspec/png_matcher/version'

Gem::Specification.new do |spec|
  spec.name          = "rspec-png_matcher"
  spec.version       = RSpec::PngMatcher::VERSION
  spec.authors       = ["Kyohei Shimada"]
  spec.email         = ["fl95to03pj30sq12@gmail.com"]
  spec.summary       = %q{This is a rspec custom matcher to compare two png images.}
  spec.description   = %q{This is a rspec custom matcher to compare two png images..}
  spec.homepage      = "https://github.com/kyohei-shimada/rspec-custom_matcher"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 2.1"
  spec.add_development_dependency "rake", "~> 13.0"

  spec.add_dependency 'rspec'
  spec.add_dependency 'chunky_png', "~> 1.3.4"
end
