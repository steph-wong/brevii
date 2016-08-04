Rails.application.routes.draw do

  root 'static_pages#home'

  get '/home',    to: 'static_pages#home'
  get '/about',   to: 'static_pages#about'
  get '/contact', to: 'static_pages#contact'

  get '/register', to: 'users#new'

  get    '/login',  to: 'sessions#new'
  post   '/login',  to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  post  'movies/:id/summaries/new' => 'summaries#create'

  # get 'movies' => 'movies#index'
  # get 'movies/:id', to: 'movies#show', as: 'movie'

  resources :users
  resources :summaries
  resources :movies

  resources :movies do
    resources :summaries
  end

end
