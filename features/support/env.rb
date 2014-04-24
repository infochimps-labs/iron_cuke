#for http_steps
require 'capybara'
require 'capybara/dsl'
require 'capybara/cucumber'
require 'capybara-webkit'
Capybara.default_driver = :webkit
require 'headless'
Headless.new.start

require 'cuken/file'
require 'cuken/port'
require 'cuken/process'
require 'cuken/runnable'
require 'cuken/cucumber/http_steps'
require 'aruba/cucumber'
