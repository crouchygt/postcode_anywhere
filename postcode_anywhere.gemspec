# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)

Gem::Specification.new do |s|
  s.name        = "postcode_anywhere"
  s.version     = "0.3"
  s.authors     = ["Matthew Crouch"]
  s.email       = ["matthew@springydevelopment.co.uk"]
  s.homepage    = ""
  s.summary     = %q{Postcode Anywhere - Wrapper for postcode lookups}
  s.description = %q{Find addresses by postcode and building number via Postcode Anywhere API}

  s.rubyforge_project = "postcode_anywhere"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_dependency("httparty", "~> 0.7.7")
  
  s.add_development_dependency "rspec"
  s.add_development_dependency "fakeweb"
  
end