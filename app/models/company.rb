class Company < ApplicationRecord
  has_many :teams
  validates :name, uniqueness: true, presence: true, length: { in: 4..30 }
  validates :bio, length: { in: 6..240 }

end
