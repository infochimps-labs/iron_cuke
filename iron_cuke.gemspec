# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "iron_cuke"
  s.version = "0.0.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Dieterich Lawson", "Infochimps"]
  s.date = "2012-08-13"
  s.description = "Test your apps on the surface that matters: the interface they specify to the network\n"
  s.email = "coders@infochimps.org"
  s.extra_rdoc_files = [
    "README.md"
  ]
  s.files = [
    ".rspec",
    "Gemfile",
    "Guardfile",
    "README.md",
    "Rakefile",
    "VERSION",
    "bin/iron_cuke",
    "features/support/env.rb",
    "iron_cuke.gemspec",
    "lib/iron_cuke.rb",
    "lib/iron_cuke/aspect.rb",
    "lib/iron_cuke/base.rb",
    "lib/iron_cuke/component.rb",
    "lib/iron_cuke/model_factory.rb",
    "lib/iron_cuke/proctor.rb",
    "lib/iron_cuke/proctors/daemon_proctor.rb",
    "lib/iron_cuke/proctors/port_proctor.rb",
    "lib/iron_cuke/proctors/templates/daemons.eruby",
    "lib/iron_cuke/proctors/templates/ports.eruby",
    "spec/iron_cuke_spec.rb",
    "spec/spec_helper.rb"
  ]
  s.homepage = "https://github.com/infochimps-labs/iron_cuke"
  s.licenses = ["Apache 2.0"]
  s.require_paths = ["lib"]
  s.rubygems_version = "1.8.24"
  s.summary = "Bulletproof testing when the machine is the app"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<configliere>, [">= 0"])
      s.add_runtime_dependency(%q<rspec>, [">= 2.8"])
      s.add_development_dependency(%q<bundler>, ["~> 1.1"])
      s.add_development_dependency(%q<rake>, [">= 0"])
      s.add_development_dependency(%q<yard>, [">= 0.7"])
      s.add_development_dependency(%q<jeweler>, [">= 1.6"])
      s.add_runtime_dependency(%q<chef>, [">= 0.10.4"])
      s.add_runtime_dependency(%q<gorillib>, [">= 0.4"])
      s.add_runtime_dependency(%q<erubis>, [">= 0"])
      s.add_runtime_dependency(%q<cucumber>, [">= 0"])
      s.add_runtime_dependency(%q<cuken>, [">= 0"])
    else
      s.add_dependency(%q<configliere>, [">= 0"])
      s.add_dependency(%q<rspec>, [">= 2.8"])
      s.add_dependency(%q<bundler>, ["~> 1.1"])
      s.add_dependency(%q<rake>, [">= 0"])
      s.add_dependency(%q<yard>, [">= 0.7"])
      s.add_dependency(%q<jeweler>, [">= 1.6"])
      s.add_dependency(%q<chef>, [">= 0.10.4"])
      s.add_dependency(%q<gorillib>, [">= 0.4"])
      s.add_dependency(%q<erubis>, [">= 0"])
      s.add_dependency(%q<cucumber>, [">= 0"])
      s.add_dependency(%q<cuken>, [">= 0"])
    end
  else
    s.add_dependency(%q<configliere>, [">= 0"])
    s.add_dependency(%q<rspec>, [">= 2.8"])
    s.add_dependency(%q<bundler>, ["~> 1.1"])
    s.add_dependency(%q<rake>, [">= 0"])
    s.add_dependency(%q<yard>, [">= 0.7"])
    s.add_dependency(%q<jeweler>, [">= 1.6"])
    s.add_dependency(%q<chef>, [">= 0.10.4"])
    s.add_dependency(%q<gorillib>, [">= 0.4"])
    s.add_dependency(%q<erubis>, [">= 0"])
    s.add_dependency(%q<cucumber>, [">= 0"])
    s.add_dependency(%q<cuken>, [">= 0"])
  end
end
