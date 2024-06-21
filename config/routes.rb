Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  namespace :api do
    namespace :v1 do
      post 'check_availability', to: 'bookings#check_availability'
      resources :users, only: [:create, :show]
      resources :bookings, only: [:create, :index, :show]
    end
  end
end
