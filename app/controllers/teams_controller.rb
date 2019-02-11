class TeamsController < ApplicationController
  before_action :find_team, only: [:show]

  def index
    @teams = Team.all
  end

  def show
  end

  private

  def find_team
    @team = Team.find(params[:id])
  end

end
