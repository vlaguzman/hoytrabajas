Rails.application.routes.draw do
  resource :users do
    resource :step_one,   only: [:show, :update], controller: 'users/wizards/step_one'
    resource :step_two,   only: [:show, :update], controller: 'users/wizards/step_two'
    resource :step_three, only: [:show, :update], controller: 'users/wizards/step_three'
  end

  devise_for :users
  devise_for :companies

  root to: "home#index"

end
