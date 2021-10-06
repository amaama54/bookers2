Rails.application.routes.draw do
  get 'searches/search'
  devise_for :users
  root "homes#top"
  get "home/about" => "homes#about"
  get "home/index" => "homes#index"
  resources :users, only: [:index, :show, :edit, :update, :create] do
    resource :relationships, only: [:create, :destroy]
    get "followings" => "relationships#followings", as: "followings"
    get "followers" => "relationships#followers", as: "followers"
  end
  resources :books, only: [:index, :show, :edit, :update, :destroy, :create] do
    resource :favorites, only: [:create, :destroy]
    resources :book_comments, only: [:create, :destroy]
  end
  get "search" => "searches#search"
end