# todos_controller.rb
class TodosController < ApplicationController
  def index
    @todos = Todo.of_user(current_user)
    render "index"
  end

  # --- index is used to shiow the list of
  # ---- todos is the todos table of ssa_db database
  # ---- whereas show_id is used on to the particular
  # ----- todo with given id  if available in the
  # ----- database.
  def show
    id = params[:id]
    todos = Todo.of_user(current_user).find(id)
    render "todo"
  end

  def create
    todo_text = params[:todo_text]
    date = DateTime.parse(params[:due_date])
    new_todos = Todo.create!(
      todo_text: todo_text,
      due_date: date,
      completed: false,
      user_id: current_user.id,
    )
    if new_todos.save
      redirect_to todos_path
    else
      flash[:error] = new_todos.errors.full_messages.join(", ")
      redirect_to todos_path
    end
  end

  def update
    id = params[:id]
    completed = params[:completed]
    todo = Todo.of_user(current_user).find(id)
    todo.completed = completed
    todo.save!
    # render_text = "updated todod completed status id #{completed}"
    # render plain: render_text
    redirect_to todos_path
  end

  def destroy
    id = params[:id]
    todo = Todo.of_user(current_user).find(id)
    todo.destroy
    redirect_to todos_path
  end
end
