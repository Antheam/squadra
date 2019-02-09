class Team < ApplicationRecord
  belongs_to :company
  has_many :user_teams
  has_many :users, through: :user_teams
end
