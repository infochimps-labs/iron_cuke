source "https://rubygems.org"

gem 'bundler',     "~> 1.1"
gem 'configliere'
gem 'json'

group :get_announces do
  gem 'chef'
end

group :gen_tests do
  gem 'gorillib', :path => '../gorillib'
  gem 'erubis'
end

group :test do
  gem 'guard',       ">= 1.0"
  gem 'guard-rspec', ">= 0.6"
end

group :run_test do
  gem 'rspec',       "~> 2.8"
  gem 'cucumber'
  gem 'cuken', :git => "git://github.com/infochimps-forks/cuken.git"
end
