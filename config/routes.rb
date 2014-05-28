Rails.application.routes.draw do

  root 'welcome#index'
  get '/search' => 'wines#search'
  get '/results' => 'wines#results'
  get '/selection' => 'wines#selection'
  get '/show' => 'wines#show'

  resources :wines, except: [:edit, :update]

  resources :users do
    resources :favorites, only: [:create, :destroy]
  end

  resources :sessions, only: [:create]

  get '/signup' => 'users#new'
  get '/signin' => 'sessions#new'
  delete '/signout' => 'sessions#destroy'

end
