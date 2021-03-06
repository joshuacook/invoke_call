# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'invoke_call/version'

Gem::Specification.new do |spec|
  spec.name          = "invoke_call"
  spec.version       = InvokeCall::VERSION
  spec.authors       = ["Joshua Cook"]
  spec.email         = ["jcook@invoca.com"]

  spec.summary       = %q{Provides a simple wrapper for placing calls using pjsua and a dsl for defining call scenarios.}
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.files        += Dir.glob("{lib,bin}/**/*")
  spec.executables   = 'invoke_call'
  spec.require_paths = ["lib"]

  spec.add_dependency 'thor'
  spec.add_development_dependency "bundler", "~> 1.8"
  spec.add_development_dependency "rake", "~> 10.0"
end
