# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'switchery/rails/version'

Gem::Specification.new do |spec|
  spec.name          = "switchery-rails"
  spec.version       = Switchery::Rails::VERSION
  spec.authors       = ['Guillaume Hain']
  spec.email         = ['zedtux@zedroot.org']
  spec.summary       = 'Use Switchery for Rails'
  spec.description   = 'This gem provides Switchery driver for your Rails ' \
                       'application'
  spec.homepage      = 'https://github.com/abpetkov/switchery'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_dependency 'railties', '~> 4'

  spec.add_development_dependency 'bundler', '~> 1.7'
  spec.add_development_dependency 'rake', '~> 10.0'
end
