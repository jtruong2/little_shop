Rails.application.routes.draw do
  root to: "welcome#index"

  get "/", to: "welcome#index"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  get "/dashboard", to: "users#show"
  get "/about", to: "welcome#about"
  get "/contact", to:"welcome#contact"

  get '/menu' => 'items#index', :as => :items
  resources :items, only: [:show]
  resources :categories, only: [:index, :show]
  resource :cart, only: [:create, :destroy, :show]
  resources :users, only: [:new, :create] do
    resources :orders, only: [:index]
  end

end
