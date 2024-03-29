# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)

Gem::Specification.new do |s|
  s.name        = "siriproxy-trein"
  s.version     = "0.0.1" 
  s.authors     = ["Rodey Seijkens"]
  s.email       = ["me@rodey.nl"]
  s.homepage    = "http://www.rodey.nl"
  s.summary     = %q{An Siri Proxy Plugin To Get Info From The Dutch Railway System}
  s.description = %q{This is plugin gives you info about the trains in the Netherlands}

  s.rubyforge_project = "siriproxy-trein"

  s.files         = `git ls-files 2> /dev/null`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/* 2> /dev/null`.split("\n")
  s.executables   = `git ls-files -- bin/* 2> /dev/null`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  # s.add_development_dependency "rspec"
  # s.add_runtime_dependency "rest-client"
end
