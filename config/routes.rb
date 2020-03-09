Rails.application.routes.draw do
  devise_for :users
  root to: 'home#index'
  resources :addresses
  resources :items
  resources :itemimages
  resources :solditems
  resources :categories
  resources :item_categories
  resources :comments
  resources :likes
  resources :users
  resources :users do
    resources :creditcards
  end
end

