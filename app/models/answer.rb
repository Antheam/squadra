class Answer < ApplicationRecord
  belongs_to :user
  belongs_to :question
  validates :content, presence: true, length: { minimum: 3 }
end
