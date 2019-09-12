Rails.application.routes.draw do
  resource :users, only: [:edit, :update]

  namespace :users do
    namespace :wizards do
      resource :step_one,   only: [:show, :update]
      resource :step_two,   only: [:show, :update]
      resource :step_three, only: [:show, :update]
      resource :step_four,  only: [:show, :update]
      resource :step_five,  only: [:show, :update]
      resource :step_six,   only: [:show, :update]
    end
  end

  devise_for :users, controllers: { registrations: 'registrations' }
  devise_for :companies

  resources :faqs, only: [:index]
  resources :offers
  resources :job_categories
  resources :companies

  root to: "home#index"

end
