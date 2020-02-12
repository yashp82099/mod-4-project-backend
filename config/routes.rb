Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      # resources :users
      resources :address
      resources :favorite
      # post '/remove' to: 'favorite#remove'
      post '/remove/fav', to:'favorite#remove'

      post '/login', to: 'sessions#create'
      get '/users/show', to: 'users#showu'
      post '/signup', to: 'users#signup'
    end
  end
end
