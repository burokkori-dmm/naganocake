Rails.application.routes.draw do
   root 'public/home#top'
    get 'home/about'
    resources :deliverys
    resources :carts_item
    resources :orders
  end

  namespace :admin do
    devise_for :admins
    resources :genres
    resources :sweets
    resources :users
    resources :orders
    patch :'order_details'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
