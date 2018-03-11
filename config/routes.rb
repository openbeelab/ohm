Rails.application.routes.draw do
  root 'static_pages#home'
  get '/cgu', to: 'static_pages#cgu'
  get '/contact', to: 'static_pages#contact'

  get '/register', to: 'users#new'
  post '/register', to: 'users#create'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
end
