# todos_controller.rb
class TodosController < ApplicationController
  def index
    render plain: Todo.order(:due_date).map { |todos| todos.to_pleasent_string }.join("\n")
  end

  # --- index is used to shiow the list of
  # ---- todos is the todos table of ssa_db database
  # ---- whereas show_id is used on to the particular
  # ----- todo with given id  if available in the
  # ----- database.
  def show_id
    begin
    rescue
      id = params[:id]
      # render plain: "his is waht you typed id #{id}"
      todos = Todo.find(id)
      render plain: todos.to_pleasent_string
    else
      render plain: "Ënter the valid id"
    end
  end
end
