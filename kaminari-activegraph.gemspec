# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'kaminari/activegraph/version'

Gem::Specification.new do |spec|
  spec.name          = 'kaminari-activegraph'
  spec.version       = Kaminari::ActiveGraph::VERSION
  spec.authors       = ['Dieter Pisarewski']
  spec.email         = ['dieter.pisarewski@gmail.com']
  spec.summary       = 'Active graph support for kaminari'
  spec.description   = 'Adds Active graph support to kaminari'
  spec.homepage      = 'https://github.com/brandnewbox/kaminari-activegraph'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_dependency 'activesupport', '>= 7.0'
  spec.add_dependency 'activegraph'
  spec.add_dependency 'kaminari', '>= 1.0'
end
