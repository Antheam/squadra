class UsersController < ApplicationController
  before_action :find_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.all
  end

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
  end
  def create
      @user = User.create(user_params)
      if @user.valid?
        redirect_to @user
      else
        render :new
      end
      # byebug
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
    params.require(:user).permit(:first_name, :last_name, :gender, :email, :user_name)
  end

end
