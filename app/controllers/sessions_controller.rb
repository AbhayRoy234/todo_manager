class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:current_user_id] = user.id
      render plain: "You have eneter the correct password"
    else
      render plain: "opps ! Enter the correct password"
    end
  end
end
