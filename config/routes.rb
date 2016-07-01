Rails.application.routes.draw do
  root to: "home#show"

  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'

  resources :sessions, only: [:create, :destroy]
  resource :home, only: [:show]
  resource :locator, only: [:show]

  get '/:user/dashboard', to: "users#show", as: :dashboard

  resources :crags, only: [:index, :new, :create, :show]

  namespace :admin do
    resources :crags, only: [:index, :edit, :destroy, :update]
    resources :users, only: [:index, :edit, :destroy]
  end
  namespace :api do
    namespace :v1 do
      resources :crags, defaults: { format: 'json' } do
      end
    end
  end
end
