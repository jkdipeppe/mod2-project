Rails.application.routes.draw do
  get 'sessions/new'
  post 'sessions/create'
  get '/sessions/logout'

  resources :venues, only: [:index, :show]
  resources :guests, only: [:new, :create, :show, :destroy]
  get '/guests/:id/analytics', to: 'guests#analytics', as: 'guests_analytics'
  get '/guest/signin', to: 'guests#signin'
  post '/guest/signin', to: 'guests#signin'

  resources :tickets, only: [:new, :create, :show, :destroy]
  resources :bands, only: [:new, :create, :show, :index]
  get '/bands/:id/analytics', to: 'bands#analytics', as: 'bands_analytics'
  get '/band/signin', to: 'bands#signin'
  post '/band/signin', to: 'bands#signin'

  resources :shows, only: [:edit, :show, :index, :new, :create, :destroy] do
    resources  :tickets, only: [:new, :create]
  end
  get '/shows/:id/analytics', to: 'shows#analytics', as: 'shows_analytics'

  get "/", to: "application#homepage", as: "/"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
