class Company < ApplicationRecord
  has_many :users
  has_many :company_questions
  has_many :questions, through: :company_questions

  validates :name, uniqueness: true, presence: true, length: { in: 4..30 }
  validates :bio, length: { in: 6..240 }

end
