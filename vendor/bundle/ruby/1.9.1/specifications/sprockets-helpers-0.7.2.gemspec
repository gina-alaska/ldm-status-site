# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "sprockets-helpers"
  s.version = "0.7.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Pete Browne"]
  s.date = "2012-09-28"
  s.description = "Asset path helpers for Sprockets 2.x applications"
  s.email = ["me@petebrowne.com"]
  s.homepage = "https://github.com/petebrowne/sprockets-helpers"
  s.require_paths = ["lib"]
  s.rubyforge_project = "sprockets-helpers"
  s.rubygems_version = "1.8.23"
  s.summary = "Asset path helpers for Sprockets 2.x applications"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<sprockets>, ["~> 2.0"])
      s.add_development_dependency(%q<appraisal>, ["~> 0.4"])
      s.add_development_dependency(%q<rspec>, ["~> 2.6"])
      s.add_development_dependency(%q<test-construct>, ["~> 1.2"])
      s.add_development_dependency(%q<rake>, [">= 0"])
    else
      s.add_dependency(%q<sprockets>, ["~> 2.0"])
      s.add_dependency(%q<appraisal>, ["~> 0.4"])
      s.add_dependency(%q<rspec>, ["~> 2.6"])
      s.add_dependency(%q<test-construct>, ["~> 1.2"])
      s.add_dependency(%q<rake>, [">= 0"])
    end
  else
    s.add_dependency(%q<sprockets>, ["~> 2.0"])
    s.add_dependency(%q<appraisal>, ["~> 0.4"])
    s.add_dependency(%q<rspec>, ["~> 2.6"])
    s.add_dependency(%q<test-construct>, ["~> 1.2"])
    s.add_dependency(%q<rake>, [">= 0"])
  end
end
