class AnswersController < ApplicationController
  before_action :require_login

  def new
    @user = current_user
    @questions = @user.company.questions
    @answers = @questions.map {|q| Answer.new(question_id: q.id)}
  end

  def create
    @user = current_user
    slack_json = build_slack_json
    slack_json[:attachments][0][:title] = "Welcome #{@user.full_name}"
    slack_json[:attachments][0][:title_link] = "#{request.base_url}#{user_path(@user)}"

    #Check that all answers have content
    valid = true
    params[:answers].each {|q_id, content| valid = false if content =~ /\A\s*\Z/ }

    if valid
      params[:answers].each do |q_id, content|
        Answer.create(content: content, user_id: params[:user_id], question_id: q_id)
        question = Question.find(q_id).content
        slack_json[:attachments][0][:fields] << { "title": "Q: #{question}", "value": ":speech_balloon: #{content}\n", "short": false }
      end
      post_user_to_slack(slack_json)
      redirect_to user_path(current_user)
    else
      flash[:errors]  = ["At least one of your answers was blank, try angain and don't be shy!"]
      redirect_to new_answer_path and return
    end
  end

  private

  def answer_params
    params.require(:answers)
  end

  def build_slack_json
    {
      "attachments": [
          {
          "fallback": "@channel Welcome Our new member, check their profile out on Squadra",
          "color": "#525760",
          "pretext": "We have a new Team Member introducing..... :drum_with_drumsticks::drum_with_drumsticks::drum_with_drumsticks: ",
          "author_name": "Squadra-Bot",
          "author_link": "",
          "author_icon": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQEjoIwQNR6vaEpexKUhdVgFIa4XVKeypeQR4SQjt8a97Wk4SCa",
          "title": "",
          "title_link": "",
          "fields": [],
          "text": "See their responses to our onboarding questions below...",
          "footer": "Powered by Squadra",
          "actions": [
            {
               "type": "button",
               "text": "Take a Quiz on your team! 🎮",
               "url": "#{request.base_url}#{quiz_home_path}"
             }]
         }]
      }
  end


  def post_user_to_slack(slack_msg_json)
    #libraries to support slack sending
    require 'net/http'
    require 'uri'
    require 'json'

    uri = URI.parse("https://hooks.slack.com/services/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")
    request = Net::HTTP::Post.new(uri)
    request.content_type = "application/json"
    request.body = JSON.dump(slack_msg_json)

    req_options = { use_ssl: uri.scheme == "https", }

    response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
      http.request(request)
    end
  end

end
