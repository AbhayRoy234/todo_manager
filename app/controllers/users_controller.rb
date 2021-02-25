class UsersController < ApplicationController
  def index
    render plain: User.order(:name).map { |todos| todos.to_pleasent_string }.join("\n")
  end

  def create
    name = params[:name]
    email = params[:email]
    password = params[:password]
    new_todos = User.create!(
      name: name,
      email: email,
      password: password,
    )
    render_text = "Hey you have added the new item in data base with id #{new_todos.id}"
    render plain: render_text
  end

  def login
    email = params[:email]
    password = params[:password]
    var = User.find_by(email: email, password: password)
    # if user.email == email && user.password == password
    val1 = var ? true : false

    if val1
      # render_text = "we found email with "
      render plain: val1
    else
      # render_text = "we not email with "
      render plain: val1
    end
    # else
    # render palin: "false"
    # end
  end

  def show
    id = params[:id]
    user = User.find(id)
    render plain: user.to_pleasent_string
  end
end
