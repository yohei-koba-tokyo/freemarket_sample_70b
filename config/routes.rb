Rails.application.routes.draw do
  devise_for :users
  root to: 'home#index'
  resources :addresses
  resources :creditcards
  resources :items do
    resources :itemimages
  end
  resources :solditems
  resources :categories
  resources :item_categories
  resources :comments
  resources :likes
end

