Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'application#welcome'
  resources :companies
  resources :teams, only: [:show, :edit, :update, :new, :create]
  resources :users, only: [:show, :edit, :update, :new, :create]
end
