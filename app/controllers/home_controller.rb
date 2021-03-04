class HomeController < ApplicationController
  def index
    render "index"
    # render plain: Todo.order(:due_date).map { |todos| todos.to_pleasent_string }.join("\n")
  end
end
