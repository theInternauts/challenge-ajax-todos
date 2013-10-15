ENV['RACK_ENV'] = 'test'

require './todo_app'
require 'capybara/rspec'


# Stop logging ActiveRecord to the console
ActiveRecord::Base.logger = Logger.new('/dev/null')

Capybara.app = Sinatra::Application
