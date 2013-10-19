require 'sinatra/activerecord/rake'
require './todo_app'

begin
  require "rspec/core/rake_task"
  desc "Run all examples"
  RSpec::Core::RakeTask.new(:spec)

  task :default => :spec
rescue LoadError
end

desc 'Start IRB with application environment loaded'
task 'console' do
  exec 'irb -r ./todo_app.rb'
end
