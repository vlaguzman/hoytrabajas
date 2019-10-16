Rails.application.routes.draw do

  resources :faqs, only: [:index]
  resources :offers
  resources :job_categories, only:[:index]
  resources :companies, only: [:index]

  namespace :companies do
    namespace :first_offer do
      resource :step_zero, only: [:show]
      resource :step_one,  only: [:show]
      resource :step_two,  only: [:show]
      resource :step_three,  only: [:show]
      resource :step_four,  only: [:show]
      resource :step_five,  only: [:show]
    end
  end

  namespace :users do
    namespace :wizards do
      resource :step_zero,    only: [:show]
      resource :step_one,     only: [:show, :update]
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


  devise_for :admin_users, {:path=>:admin, :controllers=>{:sessions=>"admin_users/sessions"}, :path_names=>{:sign_in=>"login", :sign_out=>"logout"}, :sign_out_via=>[:delete, :get]}
  ActiveAdmin.routes(self)
  devise_for :users, controllers: { registrations: 'users/registrations', :omniauth_callbacks => "users/omniauth_callbacks" }
  devise_for :companies, controllers: { registrations: 'companies/registrations' }

  resources :users, only: [:edit, :update, :show]
  resource :companies, only: [:edit, :update, :show]

  root to: "home#index"

end
