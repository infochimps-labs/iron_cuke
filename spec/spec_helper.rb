require 'bundler/setup' ; Bundler.require(:default, :development, :test)
require 'rspec/autorun'

puts "Running specs in version #{RUBY_VERSION} on #{RUBY_PLATFORM} #{RUBY_DESCRIPTION}"

if ENV['CONFIGLIERE_COV']
  require 'simplecov'
  SimpleCov.start
end
