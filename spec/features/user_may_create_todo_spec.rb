require 'spec_helper'
feature "Creating TODOs" do
  scenario "User may create a todo", js: true do
    visit '/'
    fill_in :new_todo_task, with: "Thing to do"
    click_on "Add Todo"

    within ".available-todos" do
      expect(page).to have_content("Thing to do")
    end
    expect(Todo.last.task).to eql "Thing to do"
  end
end
