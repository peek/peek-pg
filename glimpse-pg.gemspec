# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'glimpse-pg/version'

Gem::Specification.new do |gem|
  gem.name          = 'glimpse-pg'
  gem.version       = Glimpse::PG::VERSION
  gem.authors       = ['Garrett Bjerkhoel']
  gem.email         = ['me@garrettbjerkhoel.com']
  gem.description   = %q{Provide a glimpse into the Postgres queries made during your application's requests.}
  gem.summary       = %q{Provide a glimpse into the Postgres queries made during your application's requests.}
  gem.homepage      = 'https://github.com/dewski/glimpse-pg'

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ['lib']

  gem.add_dependency 'glimpse'
  gem.add_dependency 'pg'
end
