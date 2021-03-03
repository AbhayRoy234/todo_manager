# todos_controller.rb
class TodosController < ApplicationController
  def index
    render "index"
    # render plain: Todo.order(:due_date).map { |todos| todos.to_pleasent_string }.join("\n")
  end

  # --- index is used to shiow the list of
  # ---- todos is the todos table of ssa_db database
  # ---- whereas show_id is used on to the particular
  # ----- todo with given id  if available in the
  # ----- database.
  def show
    id = params[:id]
    # render plain: "his is waht you typed id #{id}"
    todos = Todo.find(id)
    render "todo"
    # render plain: todos.to_pleasent_string
    # else
    # render plain: "you have exterd the "
    # end
  end

  def create
    todo_text = params[:todo_text]
    date = DateTime.parse(params[:due_date])
    new_todos = Todo.create!(
      todo_text: todo_text,
      due_date: date,
      completed: false,
    )
    # render_text = "Hey you have added the new item in data base with id #{new_todos.id}"
    # render plain: render_text
    redirect_to todos_path
  end

  def update
    id = params[:id]
    completed = params[:completed]
    todo = Todo.find(id)
    todo.completed = completed
    todo.save!
    # render_text = "updated todod completed status id #{completed}"
    # render plain: render_text
    redirect_to todos_path
  end

  def destroy
    id = params[:id]
    todo = Todo.find(id)
    todo.destroy
    redirect_to todos_path
  end
end
