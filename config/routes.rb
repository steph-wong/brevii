Rails.application.routes.draw do

  root 'static_pages#home'

  get '/home', to: 'static_pages#home'
  get '/about', to: 'static_pages#about'
  get '/main', to: 'static_pages#main'
  get '/contact', to: 'static_pages#contact'

  get '/register', to: 'users#new'

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  get 'movies' => 'movies#index'
  get 'movies/:id', to: 'movies#show', as: 'movie'

  resources :users

end
