Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'authentication' }

  root 'home#index'

  namespace :directory do
    resources :profiles, only: [:index, :show]
    resources :practices, only: [:index, :show]
  end

  namespace :admin do
    resources :users, except: [:show] do
      get 'delete'
      get 'roles'
      post 'update_roles'
    end
    resources :positions, except: [:show] do
      get 'delete'
    end
    resources :practices, except: [:show] do
      get 'delete'
      resources :memberships, path: :members, except: [:show] do
        get 'delete'
      end
    end
    resources :videos do
      get 'delete'
    end
  end

  resources :videos do
    collection do
      get :autocomplete_video_name
      post :search
    end
  end

  mount Rop::Engine, at: '/guides', as: 'guides'
end
