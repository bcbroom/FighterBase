# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'fighter_base/version'

Gem::Specification.new do |spec|
  spec.name          = "fighter_base"
  spec.version       = FighterBase::VERSION
  spec.authors       = ["Brian Broom"]
  spec.email         = ["brian.broom@gmail.com"]

  spec.summary       = %q{Interface for API for stockfighter.io stock simulation}
  spec.description   = %q{FIghter Base gives you access to level, exchange, and order information to
                          use to build market scripts and play the levels of the Stockfighter game.}
  spec.homepage      = "https://github.com/bcbroom/FighterBase"

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "rubygems.org"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "httparty", "~> 0.13.7"
  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
end
