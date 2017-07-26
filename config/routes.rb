Rails.application.routes.draw do
  get '/menu' => 'items#index', :as => :items
  resources :items, only: [:show]
  resources :categories, only: [:index, :show]
  resources :carts, only: [:create, :destroy]
  get '/cart' => 'carts#show', :as => :viewcart
end
