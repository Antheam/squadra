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
  def valid_for_quiz?(company_id)
    self.number_of_answers(company_id) >= 3
  end

  #returns the answers for a question for a given company
  def get_answers(company_id)
    self.answers.select {|answer| answer.user.company_id == company_id }
  end

  #number of answers
  def number_of_answers(company_id)
    self.get_answers(company_id).uniq.count
  end

  #returns 3 random answers for a question by users at that company
  def get_3_random_answers(company_id)
    get_answers(company_id).sample(3)
  end

  # builds the right type of quiz_question depending on question type
  def build_for_quiz(company_id)
    if self.q_type == "text"
      build_for_quiz_text(company_id)
    elsif self.q_type == "multi"
      build_for_quiz_multi(company_id)
    else
      false
    end
  end

  #called on a MULTI question, builds a quiz question for a given company,
  #  this is a hash with x possible responses (defined by the question)
  #  only one of which is most correct
  #
  # expected quiz question format.....
  # { question : "Which is most popular: 'Cats', 'Dogs' ",
  #   answer: "Cats"
  #   options:
  #     {content: "Cats"},
  #     {content: "Dogs"},
  #     {content: "Equal"}
  # ]}
  def build_for_quiz_multi(company_id)
    return false if !valid_for_quiz?(company_id)
    quiz_question = Hash.new
    histo = multi_histo_results(company_id)
    quiz_question[:question] = "Pick the most popular response to: '#{self.content}'"
    quiz_question[:answer] = histo[0]
    quiz_question[:options] = self.options.split(",")
    quiz_question[:options] << "Equal"
    quiz_question
  end

  #returns an array containing 2 elements, the first the most popular result
  #  (or "Equal" if they are all the same), the second is a histogram of the
  #  responses for that company
  def multi_histo_results(company_id)
    histo = Hash.new
    self.options.split(',').each do |option|
      histo[option] = self.get_answers(company_id).select { |a| a.content == option }.count
    end
    results = []
    #check if its a tie
    if histo.values.uniq.count <= 1
      results << "Equal"
    else
      results << histo.max_by{|k,v| v}[0]
    end
    results << histo
    results
  end

  #called on a TEXT question, builds a quiz question for a given company,
  #  this is a hash with 3 possible responses, only one of which is correct
  #
  # expected quiz question format.....
  # { question : "Whats your fave colour?",
  #   answer: "Blue"
  #   options: [
  #     {email: "sam@sam.com", content: "Blue"},
  #     {email: "dan@dan.com", content: "Yellow"},
  #     {emal: "jeff@jeff.com:", content: "Red"}
  # ]}
  def build_for_quiz_text(company_id)
    return false if !valid_for_quiz?(company_id)
    answers = self.get_3_random_answers(company_id)
    quiz_question = Hash.new
    quiz_question[:answer] = answers.sample.user.full_name
    question_prompt = answers.find{|a| a.user.full_name == quiz_question[:answer]}.content
    quiz_question[:question] = "Who answered '#{self.content}' ..with.. '#{question_prompt}'"
    quiz_question[:options] = []
    answers.each { |answer| quiz_question[:options] << answer.user.full_name }
    quiz_question
  end
end
