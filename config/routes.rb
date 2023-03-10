Rails.application.routes.draw do
  root 'welcome#index'
  namespace :welcome do
    resources :entries, :journals
  end
  resources :entries, only: [:index, :new, :create, :show, :update, :edit, :destroy]
  resources :journals
end
