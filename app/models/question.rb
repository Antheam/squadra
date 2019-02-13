class Question < ApplicationRecord
  has_many :answers
  has_many :users, through: :answers
  validates :content, presence: true
  validates :q_type, presence: true

  def type_options
    ["text", "multi"]
  end

  #given a company ID a question will respond if it is valid for a quiz
  #  a question is valid if it has 3 or more responses by users in that company
  # def valid_for_quiz?(company_id)
  #   self.answers.select {|answer| answer.user.company_id == company_id }.uniq.count
  # end

end
