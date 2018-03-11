Rails.application.routes.draw do
  root 'static_pages#home'
  get '/cgu', to: 'static_pages#cgu'
  get '/contact', to: 'static_pages#contact'

  get '/login', to: 'users#login'
  get '/register', to: 'users#new'
  post '/register', to: 'users#create'
end
