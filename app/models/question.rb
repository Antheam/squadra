class Question < ApplicationRecord
  has_many :answers
  has_many :users, through: :answers
  validates :content, presence: true
end
