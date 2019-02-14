class Company < ApplicationRecord
  has_many :users
  has_many :company_questions
  has_many :questions, through: :company_questions
  accepts_nested_attributes_for :users

  validates :name,
            uniqueness: {message: "This company name is already taken, try another"},
            presence: {message: "You must enter a company name"},
            length: { in: 4..30 }

  validates :bio, length: { in: 6..240 }

  # method to build quiz based on company questions, quiz size must be 5 or more
  # if there are more than 8
  def build_quiz
    return false if !ready_for_quiz?
    valid_questions.sample(8).map {|question| question.build_for_quiz(self.id)}
  end

  #returns true if the company has at least 5 questions that have enough responses
  def ready_for_quiz?
    question_count >= 5 && valid_question_count >= 5
  end

  #returns the number of questions for a given company
  def question_count
    questions.count
  end

  #returns all the valid questions for a company
  def valid_questions
    questions.select { |question| question.valid_for_quiz?(self.id) }.uniq
  end

  #returns a count of all valid questions
  def valid_question_count
    valid_questions.count
  end

end
