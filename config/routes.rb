Rails.application.routes.draw do
  root 'public/home#top'
  namespace :public do
    devise_for :users
    get 'home/about'
    resources :deliverys
    resources :carts_items
  end

  namespace :admin do
    devise_for :admins
    resources :genres
    resources :sweets
    resources :users
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
