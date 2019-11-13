Rails.application.routes.draw do

  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?

  devise_for :admin_users, {:path=>:admin, :controllers=>{:sessions=>"admin_users/sessions"}, :path_names=>{:sign_in=>"sign_in", :sign_out=>"logout"}, :sign_out_via=>[:delete, :get]}
  ActiveAdmin.routes(self)
  devise_for :users, controllers:  {registrations: 'users/registrations', :omniauth_callbacks => "users/omniauth_callbacks" , sessions: 'users/sessions' }
  devise_for :companies, controllers: { registrations: 'companies/registrations' }

  resources :faqs, only: [:index]
  resources :offers
  resources :applied_offers, only: [:create]
  resources :job_categories, only:[:index]

  namespace :companies do
    namespace :first_offer do
      resource :step_zero,  only: [:show]
      resource :step_one,   only: [:show, :update]
      resource :step_two,   only: [:show, :update]
      resource :step_three, only: [:show, :update]
      resource :step_four,  only: [:show, :update]
      resource :step_five,  only: [:show, :update]
      resource :step_six,   only: [:show, :update]
      resource :step_seven, only: [:show, :update]
      resource :step_eight, only: [:show]
    end
  end

  namespace :users do
    resource :dashboard, only: [:show]
    resource :profile, only: [:show]

    namespace :wizards do
      resource :step_zero,    only: [:show]
      resource :step_one,     only: [:show, :create, :edit, :update]
      resource :step_two,     only: [:show, :update]
      resource :step_three,   only: [:show, :update]
      resource :step_four,    only: [:show, :update]
      resource :step_five,    only: [:show, :update]
      resource :step_six,     only: [:show, :update]
      resource :step_seven,   only: [:show, :update]
      resource :step_eight,   only: [:show, :update]
      resource :step_nine,    only: [:show, :update]
      resource :step_ten,     only: [:show, :update]
      resource :step_eleven,  only: [:show]
    end
  end

  resource :users, only: [:show, :edit]
  resources :companies, only: [:edit, :update, :show, :index]

  root to: "home#index"

end
