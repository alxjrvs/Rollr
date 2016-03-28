# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rollr/version'

Gem::Specification.new do |spec|
  spec.name          = "rollr"
  spec.version       = Rollr::VERSION
  spec.authors       = ["Alex Jarvis"]
  spec.email         = ["alxjrvs@gmail.com"]

  spec.summary       = %q{Random Numbers, With Style.}
  spec.description   = %q{Rollr is a Gem that provides a more familiar interface for generating random numbers - Rolling Dice. Using Rollr, developers can generate psuedorandom numbers securely and succinctly.}
  spec.homepage      = "github.com/alxjrvs/rollr"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "pry", "~> 0.10.3"
end
