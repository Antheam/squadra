class CompaniesController < ApplicationController
  before_action :find_company, only: [:show, :edit, :update, :destroy]

  def index
    @companies = Company.all
  end

  def show
    @view = params[:view] ||= "teams"
  end

  def edit
  end

  def update
    if @company.update(company_params)
      redirect_to company_path(@company)
    else
      render :edit
    end
  end

  def new
    @company = Company.new
  end

  def create
    company = Company.new(company_params)
    if company.save
      redirect_to company_path(company)
    else
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
    params.require(:company).permit(:name, :bio)
  end

end
