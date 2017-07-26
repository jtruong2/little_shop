Rails.application.routes.draw do
  get '/menu' => 'items#index', :as => :items
  resources :items, only: [:show]
end
