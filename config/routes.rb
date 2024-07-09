Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      post 'check_availability', to: 'bookings#check_availability'
      resources :users, only: [:create, :show]
      resources :bookings, only: [:create, :index, :show]
    end
  end
end
