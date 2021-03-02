class Insertsapmletododata < ActiveRecord::Migration[6.1]
  def change
    Todo.create!(
      todo_text: "chl nikal",
      due_date: Date.today,
      completed: false,
    )
  end
end
