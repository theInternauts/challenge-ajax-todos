require 'sinatra'
require 'sinatra/activerecord'

set :database, "sqlite3:///db/todo_dev.sqlite3"

class Todo < ActiveRecord::Base

  scope :available, -> { where(status: "available") }
  scope :completed, -> { where(status: "completed") }
  def complete!
    update_attributes(status: "completed")
  end

  def complete?
    status == "completed"
  end
end

get '/' do
  @todos = Todo.all
  erb :home_page
end

post '/todos' do
  @todo = Todo.create(params[:todo])
  if request.xhr?
   @todo ? "<p>"+ @todo.task + "</p>" : "creation failed"

  else
    redirect '/'
  end
end

post "/todos/:id/complete" do
  Todo.find(params[:id]).complete!
  if request.xhr?

  else
    redirect '/'
  end
end


helpers do
  def available_todos
    Todo.available
  end

  def completed_todos
    Todo.completed
  end
end
