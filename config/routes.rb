Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "home#index"

  # resources :tweet, only: [:create]
  resources :dashboard, only: [:index]

  resources :username, only: [:new, :update]

  resources :tweet, only: [:create] do
    resources :likes, only: [:create], :controller => 'likes'
    resources :bookmarks, only: [:create], :controller => 'bookmarks'
  end
end
