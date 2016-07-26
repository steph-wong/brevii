Rails.application.routes.draw do
  resources :users
  root 'application#welcome'

  get '/home', to: 'static_pages#home'
  get '/about', to: 'static_pages#about'
  get '/register', to: 'static_pages#register'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
