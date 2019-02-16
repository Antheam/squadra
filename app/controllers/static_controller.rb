class StaticController < ApplicationController
  before_action :require_login, only: [:quiz_home, :quiz_new, :quiz_results]

  #landing page
  def welcome
    redirect_to company_path(current_user.company) if logged_in?
  end

  #takes user to demo page
  def about
  end

  #new quiz
  def quiz_home
  end

  #new quiz
  def quiz_new
    @quiz_questions = current_user.company.build_quiz
  end

  #quiz results
  def quiz_results
    @answers = params[:quiz][:answers]
    @questions = params[:quiz][:questions]
    @responses = params[:quiz][:responses]
    @score = calculate_score(@answers, @responses)
  end

  private

  #calculates a score based on a users responses to questions
  #score in the format {correct: 5, of: 10}
  def calculate_score(answers, responses)
    correct = 0
    counter = 0
    answers.each do | answer|
      correct += 1 if responses[counter] == answer
      counter += 1
    end
    score = {correct: correct, of: answers.size}
  end
end
