# -*- encoding: utf-8 -*-
require File.expand_path('../lib/nominatim/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Jakub Svehla"]
  gem.email         = ["jakub.svehla@gmail.com"]
  gem.description   = %q{A Ruby wrapper for the Nominatim API.}
  gem.summary       = %q{A Ruby wrapper for the Nominatim API.}
  gem.homepage      = "https://github.com/jakubsvehla/nominatim"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "nominatim"
  gem.require_paths = ["lib"]
  gem.version       = Nominatim::VERSION

  gem.add_dependency 'faraday', '>= 2'
  gem.add_dependency 'multi_json'

  gem.add_development_dependency 'rake'
  gem.add_development_dependency 'rspec', '~> 2.10'
  gem.add_development_dependency 'webmock'
  gem.add_development_dependency 'simplecov'
  gem.add_development_dependency 'yard'
end
