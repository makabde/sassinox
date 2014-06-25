# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'sassinox/version'

Gem::Specification.new do |spec|
  spec.name          = "sassinox"
  spec.version       = Sassinox::VERSION
  spec.platform      = Gem::Platform::RUBY
  spec.authors       = ["makabde"]
  spec.email         = ["makram.abde@gmail.com"]
  spec.homepage      = ""
  spec.license       = "MIT"
  spec.summary       = ""
  spec.description   = ""

  spec.files         = `git ls-files`.split("\n")
  spec.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  spec.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "sass", "~>3.3"
  spec.add_dependency "thor"

  spec.add_development_dependency "aruba", "~> 0.5"
  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
end
