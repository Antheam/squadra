class Question < ApplicationRecord
  has_many :answers
  has_many :users, through: :answers
  validates :content, presence: true
  validates :q_type, presence: true

  def type_options
    ["text", "multi"]
  end

end
