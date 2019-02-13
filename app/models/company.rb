class Company < ApplicationRecord
  has_many :users
  has_many :company_questions
  has_many :questions, through: :company_questions

  validates :name, uniqueness: true, presence: true, length: { in: 4..30 }
  validates :bio, length: { in: 6..240 }

  #method to build quiz based on company questions
  def build_quiz



  end

  #takes a question and builds a
  def build_question(question)
    
  end



end
