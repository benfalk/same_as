# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'same_as/version'

Gem::Specification.new do |spec|
  spec.name          = 'same_as'
  spec.version       = SameAs::VERSION
  spec.authors       = ['Benjamin Falk']
  spec.email         = %w( benjamin.falk@yahoo.com )

  spec.description   = %q{ ActiveRecord addition to specify when groups of fields or whole
                           models share state with each other. }

  spec.summary       = %q{ ActiveRecord addition to specify when groups of fields or whole
                           models share state with each other. }

  spec.homepage      = ''
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = %w(lib)

  spec.add_dependency 'activesupport', '>= 3.2'

  spec.add_development_dependency 'sqlite3'
  spec.add_development_dependency 'activerecord', '~> 4.0.0'
  spec.add_development_dependency 'bundler', '~> 1.3'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'cucumber'
  spec.add_development_dependency 'rake'
end
