class Company < ApplicationRecord
  has_many :teams
  validates :name, uniqueness: true, presence: true, length: { in: 4..30 }
  validates :bio, length: { in: 6..240 }

  def all_users_count
    self.all_users.count
  end

  def all_users
    self.teams.map { |team| team.users }.flatten.uniq
  end


end
