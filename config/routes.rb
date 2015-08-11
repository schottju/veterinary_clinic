Rails.application.routes.draw do
  get 'appointments/index'

  get 'appointments/show'

  get 'appointments/new'

  get 'appointments/create'

  get 'appointments/edit'

  get 'appointments/update'

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
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

  get '/veterinarians_appointments', to: 'appointments#veterinarians_appointments'

  #Dictionaries
  get '/dictionaries', to: 'static_pages#dictionaries'
  get '/help_page', to: 'static_pages#help_page'
  get '/units_search', to: 'static_pages#units_search'
  get '/species_search', to: 'static_pages#species_search'
  get '/diseases_search', to: 'static_pages#diseases_search'
  get '/treatments_search', to: 'static_pages#treatments_search'

  resources :units, only: [ :new, :create, :edit, :update ]
  resources :diseases, only: [ :new, :create, :edit, :update ]
  resources :treatments, only: [ :new, :create, :edit, :update ]
  resources :species, only: [ :new, :create, :edit, :update ]

  resources :users, only: [ :index, :show, :new, :create, :edit, :update ] do
    resources :animals, only: [ :index, :show, :new, :create, :edit, :update ]
    resources :medical_records, only: [ :index, :show, :new, :create, :edit, :update ]
    resources :pictures, only: [ :index, :show, :new, :create, :edit, :update ]
    resources :appointments, only: [ :index, :show, :new, :create, :edit, :update ]
  end
end
