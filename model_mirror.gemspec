# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'model_mirror/version'

Gem::Specification.new do |gem|
  gem.name          = "model_mirror"
  gem.version       = ModelMirror::Rails::VERSION
  gem.authors       = ["Chris Ell"]
  gem.email         = ["chris@ellbot.com"]
  gem.description   = %q{Rails Forms for Parsley.js}
  gem.summary       = %q{Rails Forms for Parsley.js}
  gem.homepage      = "https://github.com/Chrisell/model_mirror"
  gem.license       = "MIT"

  gem.files         = `git ls-files`.split($/)
  gem.require_paths = ["lib"]

  gem.add_dependency("railties", ">= 3.0.0")
end
