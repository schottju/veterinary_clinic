Rails.application.routes.draw do
  get 'animals/index'

  get 'animals/show'

  get 'animals/new'

  get 'animals/create'

  get 'animals/edit'

  get 'animals/update'

  get 'animals/destroy'

  devise_for :users, controllers: { registrations: 'registrations' }

  devise_scope :user do
    authenticated :user do
      root 'users#show', as: :authenticated_root
    end

    unauthenticated do
      root 'devise/sessions#new', as: :unauthenticated_root
    end
  end

  resource :user, only: [:show], path: "/profile"
  resources :animals
end
