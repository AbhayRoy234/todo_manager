class UsersController < ApplicationController
  skip_before_action :ensure_user_logged_in

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
    new_user = User.new(
      first_name: first_name,
      last_name: last_name,
      email: email,
      password: password,
    )
    if new_user.save
      session[:current_user_id] = new_user.id
      redirect_to todos_path
    else
      flash[:error] = new_user.errors.full_messages.join(",   ")
      redirect_to new_user_path
    end
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
