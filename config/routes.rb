Rails.application.routes.draw do
  devise_for :users

  root to: "pages#home"

  resources :appliances do
    resources :bookings, only: [:create, :show]
  end

  delete "bookings/:id", to: "bookings#destroy"

  get "/my_appliances", to: "pages#my_appliances"
  get "/my_bookings", to: "pages#my_bookings"
  get "/my_dashboard", to: "pages#my_dashboard"

  namespace :owner do
    resources :bookings, only: :index
  end

  # namespace :client do
  #   resources :bookings, only: :index
  # end

  patch "accept/:id", to: "bookings#accept", as: :accept
  patch "decline/:id", to: "bookings#decline", as: :decline
end
