class SessionsController < ApplicationController
  skip_before_action :ensure_user_logged_in

  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:current_user_id] = user.id
      # render plain: "You have eneter the correct password"
      redirect_to "/"
    else
      render plain: "opps ! Enter the correct password"
    end
  end
end
