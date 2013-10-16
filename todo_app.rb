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

post "/todos/:id/complete" do
  todo = Todo.find(params[:id])
  todo.update_attributes(status: "completed")
  if request.xhr?

  else
    redirect '/'
  end
end


helpers do
  def available_todos
    Todo.where(:status => "available")
  end

  def completed_todos
    Todo.where(:status => "completed")
  end
end
