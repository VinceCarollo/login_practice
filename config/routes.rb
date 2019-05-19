Rails.application.routes.draw do
  resources :users, only: [:index, :new, :show, :create ]
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/login', to: 'sessions#destroy'
  get '/secret', to: 'secrets#index'
end
