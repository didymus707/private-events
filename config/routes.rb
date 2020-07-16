Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  # get 'sessions/new'
  get 'homepage/home'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get '/attend', to: 'event_attendances#new'
  post '/attend', to: 'event_attendances#create'

  resources :users, only:[:new, :create, :show]
  resources :events, except:[:update, :edit]
  
  root to: "homepage#home"
end
