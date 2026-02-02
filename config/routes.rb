Rails.application.routes.draw do
  devise_for :users

  get "up" => "rails/health#show", as: :rails_health_check

  # == Dashboard ==================================================================
  root "dashboard#index"
  get "dashboard", to: "dashboard#index", as: :dashboard
end
