require 'sidekiq/web'
require 'sidekiq/cron/web'

Rails.application.routes.default_url_options[:host] = "hoytrabajas.com"
Rails.application.routes.draw do

  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?

  authenticate :admin_user do
    mount Sidekiq::Web, at: '/sidekiq'
  end

  devise_for :admin_users, {:path=>:admin, :controllers=>{:sessions=>"admin_users/sessions"}, :path_names=>{:sign_in=>"sign_in", :sign_out=>"logout"}, :sign_out_via=>[:delete, :get]}
  ActiveAdmin.routes(self)
  devise_for :users, controllers:  {registrations: 'users/registrations', :omniauth_callbacks => "users/omniauth_callbacks" , sessions: 'users/sessions' }
  devise_for :companies, controllers: { registrations: 'companies/registrations' }

  resources :faqs, only: [:index]
  resources :offers

  namespace :offers do
    resources :cities, only: [:show]
    resources :job_categories, only: [:show]
  end

  localized do
    resources :offers
  end

  resources :applied_offers, only: [:create]
  resources :applied_offers_rest, only: [:create, :update]

  namespace :admins do
    resources :offers, only: [:edit, :update]
  end

  namespace :companies do
    resource :dashboard, only: [:show]
    resources :list_candidates, only: [:show]

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
    resource :profile, only: [:show, :update]

    namespace :wizards do
      resource :step_zero,    only: [:show]
      namespace :step_zeros do
        resource :curriculum_vitae, only: [:show, :create]
      end
      resource :step_one,     except: [:new, :destroy]
      resource :step_two,     except: [:new, :destroy]
      resource :step_three,   except: [:new, :destroy]
      resource :step_four,    except: [:new, :destroy]
      resource :step_five,    except: [:new, :destroy]
      resource :step_six,     except: [:new, :destroy]
      resource :step_seven,   except: [:new, :destroy]
      resource :step_eight,   except: [:new, :destroy]

      namespace :step_eights  do
        resources :added_work_experiences,   only: [:show]
      end

      resource :step_nine,    except: [:new, :destroy]
      namespace :step_nines   do
        resource :choices,   only: [:show]
        resources :added_educational_levels,  only: [:show]
      end

      resource :step_ten,     except: [:new, :destroy]
      namespace :step_tens    do
        resources :added_acknowledgments,     only: [:show]
      end

      resource :step_eleven,  only: [:show]
    end

  end

  resource :users, only: [:show, :edit]
  resources :companies, only: [:edit, :update, :show, :index]

  #The next one url canonicals

  # Offers
  get RoutesService.build_path('job-offers'), to: redirect('/offers')
  get RoutesService.build_path('offers-of-job'), to: redirect('/offers')
  get RoutesService.build_path('offers-search'), to: redirect('/offers')

  # Offers by category
  get RoutesService.build_path('job-offers', 'categories.general-cleaning-services'), to: redirect('/offers/job_categories/servicios-generales-y-limpieza')
  get RoutesService.build_path('job-offers', 'categories.sales-commercial'), to: redirect('/offers/job_categories/ventas-y-comercial')
  get RoutesService.build_path('job-offers', 'categories.administrative-management'), to: redirect('/offers/job_categories/gestion-administrativa')
  get RoutesService.build_path('job-offers', 'categories.operator'), to: redirect('/offers/job_categories/operario')
  get RoutesService.build_path('job-offers', 'categories.logistics-transportation'), to: redirect('/offers/job_categories/logistica-y-transporte')
  get RoutesService.build_path('job-offers', 'categories.beauty-wellness-health'), to: redirect('/offers/job_categories/belleza,-bienestar-y-salud')
  get RoutesService.build_path('job-offers', 'categories.kitchen-bar-waiters'), to: redirect('/offers/job_categories/cocina,-bar-y-meseros')
  get RoutesService.build_path('job-offers', 'categories.technology-development'), to: redirect('/offers/job_categories/tecnologia-y-programacion')
  get RoutesService.build_path('job-offers', 'categories.markeing-design-advertising'), to: redirect('/offers/job_categories/marketing,-diseno-y-publicidad')
  get RoutesService.build_path('job-offers', 'categories.protocol-events'), to: redirect('/offers/job_categories/eventos-y-protocolo')
  get RoutesService.build_path('job-offers', 'categories.security'), to: redirect('/offers/job_categories/seguridad')

  #Offer by city
  get "#{ RoutesService.build_path('offers-city')}/:city_name", to: redirect('/offers/cities/%{city_name}')

  # User Session and Registration
  devise_scope :user do
    get RoutesService.build_path(:wizards, :users), to: 'devise/sessions#new'
  end

  # Company Session and Registration
  devise_scope :company do
    get RoutesService.build_path(:first_offer, :companies), to: 'devise/sessions#new'
  end

  # Dashboards
  get RoutesService.build_path(:dashboard, :companies), to: 'companies/dashboards#show'
  get RoutesService.build_path(:dashboard, :users), to: 'users/dashboards#show'

  ###########################################
  root to: "home#index"

end
