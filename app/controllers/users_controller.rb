class UsersController < ApplicationController
  def index
    render "index"
  end

  def new
    render "users/new"
  end

  def create
    first_name = params[:first_name]
    last_name = params[:last_name]
    email = params[:email]
    password = params[:password]
    new_user = User.create!(
      first_name: first_name,
      last_name: last_name,
      email: email,
      password: password,
    )
    # render_text = "Hey you have added the new item in data base with id #{new_user.id}"
    # render plain: render_text
    new_user.save!
    redirect_to home_path
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
