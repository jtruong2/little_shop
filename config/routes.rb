Rails.application.routes.draw do
  root to: "welcome#index"

  get "/", to: "welcome#index"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  get "/dashboard", to: "users#show"

  get '/menu' => 'items#index', :as => :items
  resources :items, only: [:show]
  resources :categories, only: [:index, :show]
  resource :cart, only: [:create, :destroy, :show]
end
