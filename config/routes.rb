Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  mount PostgresqlLoStreamer::Engine => "/picture_image"
  devise_for :users, controllers: { registrations: 'registrations' }

  devise_scope :user do
    authenticated :user do
      root 'users#show_profile', as: :authenticated_root
    end

    unauthenticated do
      root 'devise/sessions#new', as: :unauthenticated_root
    end
  end

  get '/profile', to: 'users#show_profile'

  get '/veterinarian_appointments', to: 'appointments#veterinarian_appointments'
  patch '/veterinarian_appointment_cancel/:id', to: 'appointments#veterinarian_appointment_cancel', as: 'veterinarian_cancel'

  #Dictionaries
  get '/dictionaries', to: 'static_pages#dictionaries'
  get '/help_page', to: 'static_pages#help_page'
  get '/units_search', to: 'static_pages#units_search'
  get '/species_search', to: 'static_pages#species_search'
  get '/diseases_search', to: 'static_pages#diseases_search'
  get '/treatments_search', to: 'static_pages#treatments_search'

  resources :units, only: [ :new, :create, :edit, :update ]
  resources :diseases, only: [ :new, :create, :edit, :update ]
  resources :treatments, only: [ :index, :new, :create, :edit, :update ]
  resources :species, only: [ :new, :create, :edit, :update ]

  resources :veterinarians, only: [ :index ]

  resources :users, only: [ :index, :show, :new, :create, :edit, :update ] do
    resources :animals, only: [ :index, :show, :new, :create, :edit, :update ]
    resources :medical_records, only: [ :index, :show, :new, :create, :edit, :update ]
    resources :pictures, only: [ :index, :show, :new, :create, :edit, :update ]
    resources :appointments, only: [ :index, :show, :new, :create, :edit, :update ] do
      patch '/cancel', to: 'appointments#cancel'
    end
  end
end
