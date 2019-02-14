class SessionsController < ApplicationController

  #presents the login form
  def new
  end

  #handles login authentication
  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to company_path(current_user.company)
    else
      flash[:errors] = ["invalid username or password, please try again"]
      redirect_to login_path
    end
  end

  #logs out a user
  def destroy
    session.delete :user_id
    redirect_to login_path
  end

end
