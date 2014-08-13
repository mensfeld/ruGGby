# coding: utf-8
lib = File.expand_path('../lib', __FILE__)

$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'ruggby/version'

Gem::Specification.new do |spec|
  spec.name          = 'ruGGby'
  spec.version       = RuGGby::VERSION
  spec.authors       = ['Maciej Mensfeld']
  spec.description   = 'Gadu Gadu protocol client implementation in Ruby language'
  spec.email         = 'maciej@mensfeld.pl'
  spec.summary       = 'Gadu Gadu protocol client implementation in Ruby language'
  spec.homepage      = 'http://dev.mensfeld.pl/'
  spec.license       = 'MIT'
  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = %w( lib )

  spec.add_runtime_dependency 'iconv'

  spec.add_development_dependency 'bundler', '~> 1.6'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'mocha', '~> 1.1'
  spec.add_development_dependency 'rubocop'
  spec.add_development_dependency 'pry'
end
