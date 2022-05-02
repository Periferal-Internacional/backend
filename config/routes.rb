Rails.application.routes.draw do
  resources :deliverables
  resources :questions
  resources :documentations
  resources :plants
  resources :users

  post '/auth/login', to: 'authentication#login'
  post '/upload', to: 'deliverables#upload'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
