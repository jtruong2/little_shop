Rails.application.routes.draw do
  root to: "welcome#index"

  namespace :admin do
    get "/dashboard", to: "admin#index"
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
  resources :items, only: [:show]
  resources :categories, only: [:index, :show]
  resource :cart, only: [:create, :destroy, :show]
  resources :users, only: [:new, :create, :show, :edit, :update]
  resources :orders, only: [:index, :show, :new, :create] do
    post "status_cancel", :action => :status_cancel
    post "status_paid", :action => :status_paid
    post "status_completed", :action => :status_completed
  end
end
