# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'easytable/version'

Gem::Specification.new do |spec|
  spec.name          = "easytable"
  spec.version       = Easytable::VERSION
  spec.authors       = ["Anton Zimin"]
  spec.email         = ["anton@active-bridge.com"]
  spec.description   = %q{adds helper methods to generate simple table}
  spec.summary       = %q{adds helper methods to generate simple table}
  spec.homepage      = "https://github.com/antonzimin/easytable"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
