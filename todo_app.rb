require 'sinatra'
require 'sinatra/activerecord'
require 'json'

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
  @todo = Todo.create!({task: params[:task]})
  if request.xhr?
    if !@todo.nil?
      content_type :json
      @todo.to_json
    else
      "creation failed"
    end
  else
    redirect '/'
  end
end

post "/todos/:id/complete" do
  @item = Todo.find(params[:id])
  @item.complete! 
  if request.xhr?
    if !@item.nil?
      content_type :json
      @item.to_json
    else
      "completion failed"
    end
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

# @data = {"widget": {
#     "debug": "on",
#     "window": {
#         "title": "Sample Konfabulator Widget",
#         "name": "main_window",
#         "width": 500,
#         "height": 500
#     },
#     "image": { 
#         "src": "Images/Sun.png",
#         "name": "sun1",
#         "hOffset": 250,
#         "vOffset": 250,
#         "alignment": "center"
#     },
#     "text": {
#         "data": "Click Here",
#         "size": 36,
#         "style": "bold",
#         "name": "text1",
#         "hOffset": 250,
#         "vOffset": 100,
#         "alignment": "center",
#         "onMouseUp": "sun1.opacity = (sun1.opacity / 100) * 90;"
#     }
# }}