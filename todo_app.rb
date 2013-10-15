require 'sinatra'
require 'sinatra/activerecord'

set :database, "sqlite3:///db/todo_dev.sqlite3"

class Todo < ActiveRecord::Base

end

get '/' do
  @todos = Todo.all
  erb :home_page
end

post '/todos' do
  @todo = Todo.create(params[:todo])
  if request.xhr?
  # This is how to tell if a request came in over AJAX or not

  else
    redirect '/'
  end
end

