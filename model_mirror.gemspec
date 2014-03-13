# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'model_mirror/version'

Gem::Specification.new do |gem|
  gem.name          = "model_mirror"
  gem.version       = ModelMirror::Rails::VERSION
  gem.authors       = ["Chris Ell"]
  gem.email         = ["chris@ellbot.com"]
  gem.description   = %q{Simplify your validation by leveraging model validators.}
  gem.summary       = %q{Model Mirror will look to the ActiveModel validators you have on a class and use these, in conjunction with a custom form_for tag, to inject the necessary front-end validators.}
  gem.homepage      = "https://github.com/Chrisell/model_mirror"
  gem.license       = "MIT"

  gem.files         = `git ls-files`.split($/)
  gem.require_paths = ["lib"]

  gem.add_dependency("railties", ">= 3.0.0")
  gem.test_files = Dir.glob("spec/**/*_spec.rb") + %w{spec/spec_helper.rb}
  gem.add_development_dependency "rspec"
end
