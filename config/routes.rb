Rails.application.routes.draw do
  resource :users

  devise_for :users
  devise_for :companies

  root to: "home#index"

end
