class Team < ApplicationRecord
  belongs_to :company
  has_many :user_teams
  has_many :users, through: :user_teams
  validates :name, uniqueness: true, presence: true, length: { in: 4..30 }
  validates :bio, length: { in: 6..240 }
end
