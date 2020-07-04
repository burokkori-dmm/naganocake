Rails.application.routes.draw do
  namespace :public do
    get 'home/about'
    get 'home/top'
  end
  namespace :public do
    resources :deliverys
  end
  namespace :public do
    resources :carts_items
  ebd
  namespace :admin do  
    get 'users/new'
  end
  namespace :admin do
    get 'admins/new'
  end
  namespace :admin do
    get 'users/new'
  end
  namespace :public do
    get 'sweets/index'
    get 'sweets/show'
  end
  namespace :admin do
    get 'genres/index'
    get 'genres/create'
    get 'genres/edit'
    get 'genres/update'
  end
  namespace :admin do
    get 'sweets/index'
    get 'sweets/new'
    get 'sweets/create'
    get 'sweets/show'
    get 'sweets/edit'
    get 'sweets/update'
  end
  devise_for :admins
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
