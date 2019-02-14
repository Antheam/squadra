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

50.times do
  Fabricate :user
end

Company.first.questions << Question.all

# Answer.create ([
#   {content: "My Mum", question: Question.all[0], user: User.first},
#   {content: "Wine", question: Question.all[1] , user: User.first},
#   {content: "Costa Rica", question: Question.all[2] , user: User.first},
#   {content: "Cats", question: Question.all[3] , user: User.first},
#   {content: "Superman - he sucks", question: Question.all[4] , user: User.first},
#   {content: "Rise Against", question: Question.all[5] , user: User.first},
#   {content: "Poached, on muffins with smoked salmon!", question: Question.all[6] , user: User.first},
#   {content: "FrontEnd", question: Question.all[7] , user: User.first}
# ])
#
# Answer.create ([
#   {content: Faker::TvShows::GameOfThrones.character, question: Question.all[0], user: User.second},
#   {content: "Wine", question: Question.all[1] , user: User.second},
#   {content: "Costa Rica", question: Question.all[2] , user: User.second},
#   {content: "Cats", question: Question.all[3] , user: User.second},
#   {content:  Faker::TvShows::DrWho.character, question: Question.all[4] , user: User.second},
#   {content: "Rise Against", question: Question.all[5] , user: User.second},
#   {content: "Poached, on muffins with smoked salmon!", question: Question.all[6] , user: User.second},
#   {content: "BackEnd", question: Question.all[7] , user: User.second}
# ])
#
# Answer.create ([
#   {content: Faker::TvShows::GameOfThrones.character, question: Question.all[0], user: User.third},
#   {content: "Wine", question: Question.all[1] , user: User.third},
#   {content: "Costa Rica", question: Question.all[2] , user: User.third},
#   {content: "Dogs", question: Question.all[3] , user: User.third},
#   {content: Faker::TvShows::DrWho.character, question: Question.all[4] , user: User.third},
#   {content: "Rise Against", question: Question.all[5] , user: User.third},
#   {content: "Poached, on muffins with smoked salmon!", question: Question.all[6] , user: User.third},
#   {content: "FrontEnd", question: Question.all[7] , user: User.third}
# ])
#
# Answer.create ([
#   {content: Faker::TvShows::GameOfThrones.character, question: Question.all[0], user: User.fourth},
#   {content: "Beer", question: Question.all[1] , user: User.fourth},
#   {content: "Costa Rica", question: Question.all[2] , user: User.fourth},
#   {content: "Dogs", question: Question.all[3] , user: User.fourth},
#   {content: Faker::TvShows::DrWho.character, question: Question.all[4] , user: User.fourth},
#   {content: "Rise Against", question: Question.all[5] , user: User.fourth},
#   {content: "Poached, on muffins with smoked salmon!", question: Question.all[6] , user: User.fourth},
#   {content: "FrontEnd", question: Question.all[7] , user: User.fourth}
# ])
