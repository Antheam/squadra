Company.destroy_all
User.destroy_all
Answer.destroy_all
Question.destroy_all

Company.create([
  {name: "Flatiron", bio: "Building tomorrows coders"}
])


User.create([
  {first_name: "Chris", last_name: "Camacho", username: "cacamacho91",
    gender: "Male", email: "cacamacho91@gmail.com", bio:"", company: Company.first},
  {first_name: "Souley", last_name: "Sow", username: "souleyman",
    gender: "Male", email: "souleymanesow@gmail.com", bio:"", company: Company.first},
  {first_name: "Sam", last_name: "Barker", username: "bamsarker",
    gender: "Male", email: "sam.barker@flatironschool.com", bio:"", company: Company.first},
  {first_name: "Minha", last_name: "Koo", username: "kkooming",
    gender: "Female", email: "kkooming2@gmail.com", bio:"", company: Company.first},
  {first_name: "Ben", last_name: "Miller", username: "bmiller",
    gender: "Male", email: "ben.miller@flatironschool.com", bio:"", company: Company.first}
])

Company.first.users << [User.first, User.second, User.third, User.fourth, User.fifth]

Question.create([
  {content: "Who inspires you?", active: true},
  {content: "Where’s your favorite place in the world?", active: true},
  {content: "Who would you most like to swap places with for a day?", active: true},
  {content: "What’s the best meal you’ve ever had?", active: true},
  {content: "Who is your least favorite superhero?", active: true},
  {content: "What was your favorite band 10 years ago?", active: true},
  {content: "What’s something you want to do in the next year that you’ve never done before?", active: true},
  {content: "How do you like your eggs?", active: true},
  {content: "Do you collect anything?", active: true},
  {content: "Whats your favorite drink?", active: true}
])

Company.first.questions << Question.all

Answer.create ([
  {content: "My Mum", question: Question.first , user: User.first},
  {content: "Costa Rica", question: Question.second , user: User.first},
  {content: "Elon Musk", question: Question.third , user: User.first},
  {content: "Truffle Pasta - Italy Road Trip 2018", question: Question.fourth , user: User.first},
  {content: "Superman - he sucks", question: Question.fifth , user: User.first},
  {content: "Rise Against", question: Question.all[5] , user: User.first},
  {content: "Scuba Diving", question: Question.all[6] , user: User.first},
  {content: "Poached, on muffins with smoked salmon!", question: Question.all[7] , user: User.first},
  {content: "No, will never understand collecting", question: Question.all[8] , user: User.first},
  {content: "Aperol Spritz (in the summer)", question: Question.all[9] , user: User.first}
])
