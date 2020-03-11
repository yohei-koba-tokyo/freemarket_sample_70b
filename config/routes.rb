Rails.application.routes.draw do
  devise_for :users
  root to: 'home#index'

  resources :items do
    resources :itemimages
    resources :categories
  end
  resources :solditems
  resources :comments
  resources :likes
  resources :users
  resources :users do
    resources :credit
    resources :addresses
  end

  get 'items/search', to: "items#search"

end

