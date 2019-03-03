Rails.application.routes.draw do
  root "home#index"
  get "/about" => "home#about"
  get "home" => "home#index"
  devise_for :users
  resources :users
  resources :books
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
