Rails.application.routes.draw do
  resources :tags
  # root 'welcome#index'
  root 'sessions#login'
  namespace :welcome do
    resources :entries, :journals
    
  end


  resources :welcome, only: [:index]
  resources :entries, only: [:index, :new, :create, :show, :update, :edit, :destroy, :search_entries]
  resources :journals, only: [:index, :new, :create, :show, :update, :edit, :destroy]
  resources :users, only: [:new, :create, :show, :update, :edit, :destroy]

  get '/login', to: 'sessions#login'
  post '/login', to: 'sessions#create'
  post '/logout', to: 'sessions#destroy'
  get '/logout', to: 'sessions#destroy'
end
