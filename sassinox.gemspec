# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'sassinox/version'

Gem::Specification.new do |spec|
  spec.name          = "sassinox"
  spec.version       = Sassinox::VERSION
  spec.authors       = ["makabde"]
  spec.email         = ["makram.abde@gmail.com"]
  spec.license       = "MIT"
  spec.homepage      = "https://github.com/makabde/sassinox"
  spec.summary       = "Swiss Army Knife Mixins library using SCSS syntax"
  spec.description   = <<-DESC
  Sassinox is a sass powered library of extends, functions and mixins...
  DESC

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
end
