Rails.application.routes.draw do
  resources :venues
  resources :guests
  resources :tickets
  resources :bands
  resources :shows, only: [:edit, :show]
  get "/", to: "application#homepage", as: "/"
  get "guests/login", to: "guests#login"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
