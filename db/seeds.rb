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
    company: Company.first, password: "password"},
  {first_name: "Souley", last_name: "Sow", gender: "Male", email: "souleymanesow@gmail.com",
    company: Company.first, password: "password"}
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

50.times do
  Fabricate :user
end

Company.first.questions << Question.all

# Answer.create ([
#   {content: "My Mum", question: Question.first , user: User.first},
#   {content: "Costa Rica", question: Question.second , user: User.first},
#   {content: "Elon Musk", question: Question.third , user: User.first},
#   {content: "Truffle Pasta - Italy Road Trip 2018", question: Question.fourth , user: User.first},
#   {content: "Superman - he sucks", question: Question.fifth , user: User.first},
#   {content: "Rise Against", question: Question.all[5] , user: User.first},
#   {content: "Scuba Diving", question: Question.all[6] , user: User.first},
#   {content: "Poached, on muffins with smoked salmon!", question: Question.all[7] , user: User.first},
#   {content: "No, will never understand collecting", question: Question.all[8] , user: User.first},
#   {content: "Aperol Spritz (in the summer)", question: Question.all[9] , user: User.first}
# ])

# Answer.create ([
#   {content: "My Mum", question: Question.first , user: User.second},
#   {content: "Costa Rica", question: Question.second , user: User.second},
#   {content: "Elon Musk", question: Question.third , user: User.second},
#   {content: "Truffle Pasta - Italy Road Trip 2018", question: Question.fourth , user: User.second},
#   {content: "Superman - he sucks", question: Question.fifth , user: User.second},
#   {content: "Rise Against", question: Question.all[5] , user: User.second},
#   {content: "Scuba Diving", question: Question.all[6] , user: User.second},
#   {content: "Poached, on muffins with smoked salmon!", question: Question.all[7] , user: User.second},
#   {content: "No, will never understand collecting", question: Question.all[8] , user: User.second},
#   {content: "Aperol Spritz (in the summer)", question: Question.all[9] , user: User.second}
# ])

Answer.create ([
  {content: "My Mum", question: Question.first , user: User.third},
  {content: "Costa Rica", question: Question.second , user: User.third},
  {content: "Elon Musk", question: Question.third , user: User.third},
  {content: "Truffle Pasta - Italy Road Trip 2018", question: Question.fourth , user: User.third},
  {content: "Superman - he sucks", question: Question.fifth , user: User.third},
  {content: "Rise Against", question: Question.all[5] , user: User.third},
  {content: "Scuba Diving", question: Question.all[6] , user: User.third},
  {content: "Poached, on muffins with smoked salmon!", question: Question.all[7] , user: User.third},
  {content: "No, will never understand collecting", question: Question.all[8] , user: User.third},
  {content: "Aperol Spritz (in the summer)", question: Question.all[9] , user: User.third}
])
