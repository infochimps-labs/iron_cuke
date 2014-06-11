#for http_steps
require 'capybara'
require 'capybara/dsl'
require 'capybara/cucumber'
Capybara.default_driver = :selenium
require 'headless'
Headless.new.start

require 'cuken/file'
require 'cuken/port'
require 'cuken/process'
require 'cuken/runnable'
require 'cuken/cucumber/http_steps'
require 'aruba/cucumber'
