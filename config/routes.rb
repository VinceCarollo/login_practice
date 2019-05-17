Rails.application.routes.draw do
  resources :users, only: [:index, :new, :show, :create ]
  get '/login', to: 'sessions#login'
  post '/login', to: 'sessions#authorize'
end
