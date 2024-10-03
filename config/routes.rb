Rails.application.routes.draw do
  devise_for :users
  resources :patients
  get "dashboard", to: "dashboard#index"

  root "patients#index"
end
