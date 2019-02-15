class CompaniesController < ApplicationController
  before_action :require_login
  before_action :admin?, only: [:index]
  skip_before_action :require_login, only: [:new, :create]
  before_action :find_company, only: [:show, :edit, :update, :destroy]


  def index
    @companies = Company.all
  end

  def show
    if current_user.answers.count < current_user.company.questions.count
      @answers_needed = true
    end
    @users = current_user.company.users.sort_by{|u| u.created_at}.reverse
  end

  def edit
  end

  def update
    if @company.update(company_params)
      redirect_to company_path(@company)
    else
      flash.now[:errors] = @company.errors.full_messages
      render :edit
    end
  end

  def new
    @company = Company.new
    @user = User.new
    @company.users << @user
  end

  def create
    @company = Company.new(company_params)
    if @company.save
      session[:user_id] = @company.users.first.id
      redirect_to company_path(@company)
    else
      flash.now[:errors] = @company.errors.full_messages
      @user = @company.users.first
      render :new
    end
  end

  def destroy
    @company.destroy
    redirect_to companies_path
  end

  private

  def find_company
    @company = Company.find(params[:id])
  end

  def company_params
    params.require(:company).permit(:name, :bio, users_attributes: [
      :first_name,
      :last_name,
      :email,
      :password,
      :password_confirmation,
      :gender
      ])
  end

  def require_login
    authorized?
  end

end
