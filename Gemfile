source 'https://rubygems.org'

gem 'configliere'
gem 'rspec',       '>= 2.8',   :require => false

group :get_announces do
  gem 'chef',      '~> 10.16.4'
end

group :gen_tests do
  gem 'gorillib', '~> 0.5.0'
  gem 'erubis'
end

group :run_test do
  gem 'cucumber'
  gem 'cuken', :git => 'git://github.com/infochimps-forks/cuken.git'
end

# --------------------------------------------------------------------------

# Only gems that you want listed as development dependencies in the gemspec
group :development do
  gem 'bundler',     '~> 1.1'
  gem 'rake',                    :require => false
  gem 'yard',        '>= 0.7',   :require => false
  gem 'jeweler',     '>= 1.6',   :require => false
end

group :docs do
  gem 'redcarpet',   '>= 2.1',   :platform => [:ruby]
  gem 'kramdown',                :platform => [:jruby]
end

# Gems for testing and coverage
group :test do
  gem 'simplecov',   '>= 0.5',   :platform => [:ruby_19],   :require => false
  gem 'json'
end

# Gems you would use if hacking on this gem (rather than with it)
group :support do
  gem 'pry'
  # gem 'perftools.rb',            :platform => [:mri]
  #
  gem 'guard',       '>= 1.0',   :platform => [:ruby_19]
  gem 'guard-rspec', '>= 0.6',   :platform => [:ruby_19]
  gem 'guard-yard',              :platform => [:ruby_19]
  if RUBY_PLATFORM.include?('darwin')
    gem 'rb-fsevent', '>= 0.9',  :platform => [:ruby_19]
  end
  if ENV['GORILLIB_YARD']
    gem 'guard-livereload', '>= 1.0'
  end
end
