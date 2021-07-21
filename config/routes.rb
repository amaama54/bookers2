Rails.application.routes.draw do
  devise_for :users
  root "homes#top"
  get "home/about" => "homes#about"
  resources :users, only: [:index, :show, :edit, :update, :create]
  resources :books, only: [:index, :show, :edit, :update, :destroy, :create]
end
