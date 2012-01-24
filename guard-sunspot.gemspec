# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "guard-sunspot/version"

Gem::Specification.new do |s|
  s.name        = "guard-sunspot"
  s.version     = Guard::Sunspot::VERSION
  s.authors     = ["John Hampton"]
  s.email       = ["john@topagentnetwork.com"]
  s.homepage    = "http://github.com/cleanoffer/guard-sunspot"
  s.summary     = 'Guard gem for sunspot solr'
  s.description = 'Guard::Sunspot automatically starts and stops your solr server.'

  s.rubyforge_project = "guard-sunspot"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  # s.add_development_dependency "rspec"
  # s.add_runtime_dependency "rest-client"
  s.add_runtime_dependency "guard"
  s.add_runtime_dependency "sunspot_solr"
end
