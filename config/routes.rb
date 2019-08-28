Rails.application.routes.draw do
  devise_for :companies
  devise_for :users

  namespace :users do
    resource :profile
  end
  root to: "home#index"
end
