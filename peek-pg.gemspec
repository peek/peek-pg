# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'peek-pg/version'

Gem::Specification.new do |gem|
  gem.name          = 'peek-pg'
  gem.version       = Peek::PG::VERSION
  gem.authors       = ['Garrett Bjerkhoel']
  gem.email         = ['me@garrettbjerkhoel.com']
  gem.description   = %q{Take a peek into the Postgres queries made during your application's requests.}
  gem.summary       = %q{Take a peek into the Postgres queries made during your application's requests.}
  gem.homepage      = 'https://github.com/peek/peek-pg'

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ['lib']

  gem.add_dependency 'peek'
  gem.add_dependency 'pg'
  gem.add_dependency 'concurrent-ruby'
  gem.add_dependency 'concurrent-ruby-ext'
end
