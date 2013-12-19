# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'functional/lists/version'

Gem::Specification.new do |spec|
  spec.name          = "functional-lists"
  spec.version       = Functional::Lists::VERSION
  spec.authors       = ["thatrubylove"]
  spec.email         = ["thatrubylove@gmail.com"]
  spec.description   = Functional::Lists::DESCRIPTION
  spec.summary       = Functional::Lists::SUMMARY
  spec.homepage      = "https://github.com/thatrubylove/functional-lists"
  spec.license       = "DWTFYW"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
