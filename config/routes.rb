Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

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

  resources :appliances, only: [:index, :show, :new, :create] do
    resources :bookings, only: [:create, :show]
  end

  get "/my_appliances", to: "pages#my_appliances"
  get "/my_bookings", to: "pages#my_bookings"

  namespace :owner do
    resources :bookings, only: :index
  end

  # namespace :client do
  #   resources :bookings, only: :index
  # end

  patch "accept/:id", to: "bookings#accept", as: :accept
  patch "decline/:id", to: "bookings#decline", as: :decline
end
