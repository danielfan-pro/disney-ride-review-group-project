Rails.application.routes.draw do
  root 'static_pages#index'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/rides", to: "static_pages#index"
  get "/rides/:id", to: "static_pages#index"

  namespace :api do
    namespace :v1 do
      resources :rides, only: [:index, :show]
      post 'rides/search', to: 'rides#search'
    end
  end
  resources :rides, only: [:new, :create]
end
