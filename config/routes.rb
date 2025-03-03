Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  resources :appliances, only: [:index, :new, :create]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  # resources :appliances do
  #   resources :bookings, only: [:new, :create]
  # end

  # resources :bookings do
  #   member do
  #     patch '/decline', to: 'bookings#decline'
  #     patch 'accept', to: 'bookings#accept'
  #   end
  # end
  resources :appliances, only: [:index, :show] do
    resources :bookings, only: [:create]
  end
end
