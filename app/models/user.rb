class User < ApplicationRecord
  has_many :answers
  has_many :user_teams
  has_many :teams, through: :user_teams
end
