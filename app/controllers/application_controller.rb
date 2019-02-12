class ApplicationController < ActionController::Base
  helper_method :current_user, :logged_in?

  def welcome
  end

  def current_user
    if session[:user_id]
      User.find(session[:user_id])
    else
      User.new
    end
  end

  def logged_in?
    !!current_user.id
  end

  def require_login
    redirect_to login_path unless session.include? :user_id
  end

  def authorized?
    if !logged_in?
      flash[:errors] = ["you are not logged in"]
      redirect_to login_path and return  # double redirect safeguard
    end
  end
end
