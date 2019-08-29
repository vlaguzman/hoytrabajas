Rails.application.routes.draw do
  devise_for :companies
  devise_for :users

  namespace :users do
    resource :profiles, only: [:new, :create, :show]
  end
  root to: "home#index"
end
