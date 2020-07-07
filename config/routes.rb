Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  # get 'sessions/new'
  get 'homepage/home'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resources :users, only:[:new, :create, :show]
  resources :events, except:[:update, :edit]
  resources :event_attendances, only:[:new, :create, :show]
  
  root to: "homepage#home"
end
