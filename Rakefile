require 'rubygems' unless defined?(Gem)
require 'bundler/setup'
Bundler.setup(:default, :development)
require 'rake'

task :default => :rspec

require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new(:rspec) do |spec|
  Bundler.setup(:default, :development, :test)
  spec.pattern = 'spec/**/*_spec.rb'
end

desc "Run RSpec with code coverage"
task :cov do
  ENV['IRONCUKE_COV'] = "yep"
  Rake::Task[:rspec].execute
end

require 'yard'
YARD::Rake::YardocTask.new do
  Bundler.setup(:default, :development, :docs)
end

require 'jeweler'
Jeweler::Tasks.new do |gem|
  Bundler.setup(:default, :development, :test)
  gem.name        = 'iron_cuke'
  gem.homepage    = 'https://github.com/infochimps-labs/iron_cuke'
  gem.license     = 'Apache 2.0'
  gem.email       = 'coders@infochimps.org'
  gem.authors     = ['Dieterich Lawson', 'Infochimps']

  gem.summary     = %Q{Bulletproof testing when the machine is the app}
  gem.description = <<-EOF
Test your apps on the surface that matters: the interface they specify to the network
EOF
  gem.executables = []
end
Jeweler::RubygemsDotOrgTasks.new
