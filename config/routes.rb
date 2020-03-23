Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }
  root to: 'home#index'

  resources :items do

    
    resources :itemimages
    resources :categories
    collection do
      get 'get_category_children', defaults: { format: 'json' }
      get 'get_category_grandchildren', defaults: { format: 'json' }
      get 'soldout'
      get 'unsold'
      get  'purchase/:id'=>  'items#purchase', as: 'purchase'
      get  'done'=>      'items#done', as: 'done'
    end
    member do
      post 'pay'
    end
      
  end
  resources :solditems
  resources :comments
  resources :likes
  resources :users
  resources :users do
    resources :addresses
  end
  resources :credits
end