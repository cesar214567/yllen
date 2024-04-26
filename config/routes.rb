Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :types
  resources :subtypes
  resources :items do
    resources :reservations, only: [:create]
  end
  resources :reservations
  resources :inventories, only:[:new,:create]
end
