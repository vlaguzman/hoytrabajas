Rails.application.routes.draw do
  #TODO u cant modify a idividual user is dont change to 'resources'
  resource :users, only: [:edit, :update, :show]

  resources :faqs, only: [:index]
  resources :offers
  resources :job_categories, only:[:index]

  namespace :companies do
    namespace :first_offer do
      resource :step_zero, only: [:show]
      resource :step_one,  only: [:show]
    end
  end

  namespace :users do
    namespace :wizards do
      resource :step_zero,  only: [:show]
      resource :step_one,   only: [:show, :update]
      resource :step_two,   only: [:show, :update]
      resource :step_three, only: [:show, :update]
      resource :step_four,  only: [:show, :update]
      resource :step_five,  only: [:show, :update]
      resource :step_six,   only: [:show, :update]
      resource :step_seven, only: [:show, :update]
      resource :step_eight, only: [:show, :update]
      resource :step_nine,  only: [:show, :update]
      resource :step_ten,  only: [:show]
    end
  end


  devise_for :users, controllers: { registrations: 'users/registrations' }
  devise_for :companies,  controllers: { registrations: 'companies/registrations' }

  resources :companies, only: [:index, :show, :edit]

  root to: "home#index"

end
