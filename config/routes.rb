Rails.application.routes.draw do
  devise_for :companies
  devise_for :users

  resource :users, only: [:new, :create, :show]
  root to: "home#index"
end
