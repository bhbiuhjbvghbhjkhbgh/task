Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'
  get 'home/about' => 'homes#about' , as: 'about'
  resources :books , only: [:new, :show, :index, :destroy, :create, :edit, :update]
  resources :users, only: [:show, :edit, :update, :index, :book, :create]
  post 'books/:id' => 'books#show'
  post 'users/:id' => 'users#create'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
