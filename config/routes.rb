Rails.application.routes.draw do
  root 'welcome#index'
  namespace :welcome do
    resources :entries, :journals
  end
  resources :entries 
  resources :journals
end
