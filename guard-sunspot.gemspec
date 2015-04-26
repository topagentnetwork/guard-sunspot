# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "guard/sunspot/version"

Gem::Specification.new do |s|
  s.name        = "guard-sunspot"
  s.version     = Guard::SunspotVersion::VERSION
  s.authors     = ["John Hampton"]
  s.email       = ["john@topagentnetwork.com"]
  s.homepage    = "http://github.com/cleanoffer/guard-sunspot"
  s.summary     = 'Guard gem for sunspot solr'
  s.description = 'Guard::Sunspot automatically starts and stops your solr server.'
  s.license     = 'MIT'

  s.rubyforge_project = "guard-sunspot"

  s.files        = Dir.glob('{lib}/**/*') + %w[LICENSE README.md]
  s.require_path = 'lib'

  s.add_dependency 'guard', '~> 2.0'
  s.add_dependency 'guard-compat', '~> 1.1'
  s.add_dependency "sunspot_solr"

  s.add_development_dependency 'rspec', '~> 3.0'
  s.add_development_dependency 'timecop'
  s.add_development_dependency 'simplecov'
  s.add_development_dependency 'poltergeist'
end
