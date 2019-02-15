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
      flash.now[:errors] = @user.errors.full_messages
      render :edit
    end
  end

  def new
    @user = User.new

    #If a user is being created they have been sent a link, they should not be
    #  already logged in - if they are they will be signed out and when they try to create
    #  another account they will be told they already exist in the DB
    session.delete :user_id

    if params[:company_id] && Company.exists?(id: params[:company_id])
      @company = Company.find(params[:company_id])
    else
      flash[:errors] = ["Your link does not contain a valid comapny ID, speak to
        your admin and check you have copied your invite URL correctly"]
      redirect_to root_path
    end

  end

  def create
    @user = User.new(user_params)
    @company = @user.company

    if @user.save
      session[:user_id] = @user.id
      redirect_to company_path(@company)
    else
      flash.now[:errors] = @user.errors.full_messages
      render :new
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
