Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'types/search', to: 'types#search', as: :search_types
  resources :types
  get 'subtypes/search', to: 'subtypes#search', as: :search_subtypes
  resources :subtypes
  resources :items do
    resources :reservations, only: [:create]
  end
  resources :reservations
  resources :inventories, only:[:new,:create]
end
