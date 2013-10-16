require 'spec_helper'
feature "Completing TODOs", js: true do
  scenario "User may complete a todo" do
    todo = Todo.create(task: "Another thing to do")
    visit '/'

    within "#todo-#{todo.id}" do
      click_on "Complete!"
    end

    within ".available-todos" do
      expect(page).not_to have_content("Another thing to do")
    end

    within ".completed-todos" do
      expect(page).to have_content("Another thing to do")
    end

    todo.reload
    expect(todo).to be_complete
  end
end
