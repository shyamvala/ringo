# -*- encoding: utf-8 -*-
require File.expand_path('../lib/ringo/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Derek Hammer"]
  gem.email         = ["derek.r.hammer@gmail.com"]
  gem.description   = %q{Ringo is a rails gem that allows you to interact with Mingle from the
command line.}
  gem.summary       = %q{Ringo is a rails gem that allows you to interact with Mingle from the
command line.}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "ringo"
  gem.require_paths = ["lib"]
  gem.version       = Ringo::VERSION
  gem.add_development_dependency "rspec"
  gem.add_dependency 'nokogiri'
  gem.add_dependency 'formatador'
  gem.add_dependency 'wrest'
end
