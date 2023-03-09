Rails.application.routes.draw do
  root 'entries#index'
  resources :entries, only: [:new, :create, :destroy]
  resources :journals, only: [:new, :create, :destroy]
end
