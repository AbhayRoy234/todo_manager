class HomeController < ApplicationController
  def index
    @current_user_id = session[:current_user_id]
    render "index"
    # render plain: Todo.order(:due_date).map { |todos| todos.to_pleasent_string }.join("\n")
  end
end
