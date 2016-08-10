Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'authentication' }

  root 'home#index'

  resources :profile, only: [:show]
  resources :admin, only: [:index]

  namespace :admin do
    resources :users do
      get 'delete'
    end
    resources :positions do
      get 'delete'
    end
    resources :practices do
      get 'delete'
    end
  end

  mount Rop::Engine, at: '/guides', as: 'guides'
  mount Screencasts::Engine, at: '/videos', as: 'videos'
end
