Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'static#welcome'

  # custom routes for quiz
  get '/quiz', to: 'static#quiz_home', as: 'quiz_home'
  get '/quiz/new', to: 'static#quiz_new', as: 'new_quiz'
  get '/quiz/results', to: 'static#quiz_home', as: 'quiz_results_redir'
  post '/quiz/results', to: 'static#quiz_results', as: 'quiz_results'
  get '/about', to: 'static#about', as: 'about'

  get '/join', to: 'companies#new', as: 'join'
  resources :companies

  resources :answers, only: [:new, :create]
  resources :users, only: [:destroy,:show, :edit, :update]

  # user account management
  get '/signup', to: 'users#new', as: 'signup'
  post '/signup', to: 'users#create'

  # sessions management
  get '/login', to: 'sessions#new', as: 'login'
  post '/sessions', to: 'sessions#create', as: 'sessions'
  post '/logout', to: 'sessions#destroy', as: 'logout'
end
