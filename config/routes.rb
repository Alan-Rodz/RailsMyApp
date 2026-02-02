Rails.application.routes.draw do
  devise_for :users

  get "up" => "rails/health#show", as: :rails_health_check

  root "sessions#new"
  get "dashboard", to: "dashboard#index", as: :dashboard

  resource :session, only: [ :new, :create, :destroy ]
  resources :users, only: [ :new, :create ]
  resources :password_resets, only: [ :new, :create, :edit, :update ]
end
