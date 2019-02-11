class CompaniesController < ApplicationController
  before_action :find_company, only: [:show]

  def index
    @companies = Company.all
  end

  def show
    @view = params[:view] ||= "teams"
  end

  private

  def find_company
    @company = Company.find(params[:id])
  end

end
