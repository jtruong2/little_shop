Rails.application.routes.draw do
  root to: "welcome#index"

  namespace :admin do
    resources :items, only: [:index, :new, :create, :edit, :update]
  end
  get "/", to: "welcome#index"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  get "/dashboard", to: "users#show"
  get '/orders', to: "orders#index"
  get "/about", to: "welcome#about"
  get "/contact", to:"welcome#contact"
  get '/menu' => 'items#index', :as => :items
  #post '/menu' => 'items#create'
  resources :items, only: [:show]
  resources :categories, only: [:index, :show]
  resource :cart, only: [:create, :destroy, :show]
  resources :users, only: [:new, :create, :show]
  resources :orders, only: [:index, :show, :new, :create]
end
