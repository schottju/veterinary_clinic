Rails.application.routes.draw do
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
  get '/dictionaries', to: 'static_pages#dictionaries'

  get '/units_search', to: 'static_pages#units_search'
  get '/species_search', to: 'static_pages#species_search'
  get '/diseases_search', to: 'static_pages#diseases_search'
  get '/treatments_search', to: 'static_pages#treatments_search'

  resources :units, only: [ :new, :create, :edit, :update ]
  resources :diseases, only: [ :new, :create, :edit, :update ]
  resources :treatments, only: [ :new, :create, :edit, :update ]
  resources :species, only: [ :new, :create, :edit, :update ]

  resources :users do
    resources :animals
    resources :medical_records
    resources :images
    resources :appointments
  end
end
