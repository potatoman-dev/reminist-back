Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      root "home#index"

      mount_devise_token_auth_for 'User', at: 'auth', controllers: {
        registrations: 'api/v1/auth/registrations',
            sessions: 'api/v1/auth/sessions'
      }

      resources :people, only: [:index, :create, :show, :update, :destroy] do
        resources :conversations, only: [:index, :create, :show, :update, :destroy]
        collection do
          get 'search'
        end
      end
    end
  end
  # get "up" => "rails/health#show", as: :rails_health_check
end
