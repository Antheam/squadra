class AnswersController < ApplicationController
  before_action :require_login

  def new
    @user = User.find(params[:user_id])
    @questions = @user.company.questions
    @answers = @questions.map {|q| Answer.new(question_id: q.id)}
  end

  def create
    @user = User.find(params[:user_id])
    params[:answers].each do |q_id, content|
      Answer.create(content: content, user_id: params[:user_id], question_id: q_id)
    end
    #Send answers to slack
    redirect_to user_path(params[:user_id])
  end

  private

  def answer_params
    params.require(:answers)
  end

end
