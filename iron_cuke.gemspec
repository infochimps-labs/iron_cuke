# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "iron_cuke"
  s.version = "0.0.4"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Dieterich Lawson", "Infochimps"]
  s.date = "2014-04-11"
  s.description = "Test your apps on the surface that matters: the interface they specify to the network\n"
  s.email = "coders@infochimps.com"
  s.extra_rdoc_files = [
    "README.md"
  ]
  s.files         = `git ls-files`.split($/)
  s.executables   = s.files.grep(/^bin/){ |f| File.basename(f) }
  s.test_files    = s.files.grep(/^(spec|features)/)
  s.homepage = "https://github.com/infochimps-labs/iron_cuke"
  s.licenses = ["Apache 2.0"]
  s.require_paths = ["lib"]
  s.rubygems_version = "1.8.24"
  s.summary = "Bulletproof testing when the machine is the app"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<configliere>, ["0.4.18"])
      s.add_runtime_dependency(%q<rspec>, ["2.14.1"])
      s.add_development_dependency(%q<rake>, ["10.1.1"])
      s.add_development_dependency(%q<yard>, ["0.8.7.3"])
      s.add_runtime_dependency(%q<chef>, ["10.16.6"])
      s.add_runtime_dependency(%q<gorillib>, ["0.5.0"])
      s.add_runtime_dependency(%q<erubis>, ["2.7.0"])
      s.add_runtime_dependency(%q<cucumber>, ["1.3.10"])
      s.add_runtime_dependency(%q<aruba>, ["0.5.4"])
    else
      s.add_dependency(%q<configliere>, [">= 0"])
      s.add_dependency(%q<rspec>, [">= 2.8"])
      s.add_dependency(%q<bundler>, ["~> 1.1"])
      s.add_dependency(%q<rake>, [">= 0"])
      s.add_dependency(%q<yard>, [">= 0.7"])
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
    s.add_dependency(%q<chef>, [">= 0.10.4"])
    s.add_dependency(%q<gorillib>, [">= 0.4"])
    s.add_dependency(%q<erubis>, [">= 0"])
    s.add_dependency(%q<cucumber>, [">= 0"])
    s.add_dependency(%q<cuken>, [">= 0"])
  end
end

