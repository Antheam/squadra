Company.destroy_all
User.destroy_all
CompanyQuestion.destroy_all
Answer.destroy_all
Question.destroy_all

Company.create([
  {name: "Flatiron", bio: "Building tomorrows coders"}
])

User.create([
  {first_name: "Chris", last_name: "Camacho", gender: "Male", email: "cacamacho91@gmail.com",
    company: Company.first, password: "password", admin:true},
  {first_name: "Souley", last_name: "Sow", gender: "Male", email: "souleymanesow@gmail.com",
    company: Company.first, password: "password", admin:true}
])

Company.first.users << [User.first, User.second]

Question.create([
  {content: "Who inspires you?", active: true, q_type: "text" },
  {content: "Beer or Wine?", active: true, q_type: "multi", options:"Beer,Wine"},
  {content: "Where’s your favorite place in the world?", active: true, q_type: "text"},
  {content: "Cats or Dogs?", active: true, q_type: "multi", options:"Cats,Dogs"},
  {content: "Who is your least favorite superhero?", active: true, q_type: "text"},
  {content: "What was your favorite band 10 years ago?", active: true, q_type: "text"},
  {content: "How do you like your eggs?", active: true, q_type: "text"},
  {content: "FrontEnd or BackEnd (keep it PG)?", active: true, q_type: "multi", options:"FrontEnd,BackEnd"}
])

# uncomment below to build x fake users (default 50)
# 50.times do
#   Fabricate :user
# end

Company.first.questions << Question.all

Answer.create ([
  {content: "Elon Musk, what a beast", question: Question.all[0], user: User.first},
  {content: "Wine", question: Question.all[1] , user: User.first},
  {content: "Costa Rica", question: Question.all[2] , user: User.first},
  {content: "Cats", question: Question.all[3] , user: User.first},
  {content: "Superman - he is the worst", question: Question.all[4] , user: User.first},
  {content: "Pink Floyd", question: Question.all[5] , user: User.first},
  {content: "Poached, on muffins with smoked salmon!", question: Question.all[6] , user: User.first},
  {content: "FrontEnd", question: Question.all[7] , user: User.first}
])
