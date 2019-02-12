class UsersController < ApplicationController
  before_action :find_user, only: [:show, :edit, :update, :destroy]
  before_action :require_login
  skip_before_action :require_login, only: [:new, :create]

  def show
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  def new
    @user = User.new
    #if a user who is creating a new user is logged in, ensure that user is being
    # created is made part of their company
    if logged_in?
      @company = current_user.company
    else
      if params[:company_id]
        @company = Company.find(params[:company_id])
      else
        flash[:errors] = ["Your link does not contain a valid comapny ID, speak to
          your admin and check you have copied your invite URL correctly"]
      end
    end
  end

  def create
    user = User.new(user_params)
    if user.valid?
      user.save
      session[:user_id] = user.id
      redirect_to company_path(params[:company_id])
    else
      flash[:errors] = ['something went wrong, try again']
      redirect_to signup_path + params[:company_id]
    end
  end

  def destroy
    @user.destroy
    redirect_to company_path(@user.company)
  end

  private

  def find_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :gender, :email, :password, :password_confirmation,
       :company_id)
  end

end
