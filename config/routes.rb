Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'application#welcome'
  resources :companies
<<<<<<< HEAD
  resources :users
  resources :answers, only: [:new, :create]
=======
  resources :teams, only: [:show, :edit, :update, :new, :create]
  resources :users, only: [:index,:show, :edit, :update, :new, :create]
>>>>>>> 237b071311d2d96cb9d082b81db107abb44824a1
end
