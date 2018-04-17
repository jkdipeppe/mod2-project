Rails.application.routes.draw do
  get 'sessions/new'
  post 'sessions/create'

  resources :venues
  resources :guests
  get '/guest/signin', to: 'guests#signin'
  post '/guest/signin', to: 'guests#signin'

  resources :tickets, only: [:new, :create, :show]
  resources :bands
  get '/band/signin', to: 'bands#signin'
  post '/band/signin', to: 'bands#signin'

  resources :shows, only: [:edit, :show, :index] do
    resources  :tickets, only: [:new, :create]
  end
  get "/", to: "application#homepage", as: "/"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
