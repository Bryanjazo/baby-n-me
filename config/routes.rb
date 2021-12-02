Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :conversations
    end
  end
  namespace :api do
    namespace :v1 do
      resources :channels
    end
  end
  namespace :api do
    namespace :v1 do
      resources :messages
    end
  end
  namespace :api do
    namespace :v1 do
      resources :rates
    end
  end
  namespace :api do
    namespace :v1 do
      resources :sellings
    end
  end
  namespace :api do
    namespace :v1 do
      resources :sessions
    end
  end
  namespace :api do
    namespace :v1 do
      resources :users
    end
  end

  mount ActionCable.server => '/cable'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
