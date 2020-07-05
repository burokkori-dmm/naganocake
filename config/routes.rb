Rails.application.routes.draw do

  root 'public/home#top'
  namespace :public do
    get 'home/about'
    devise_for :users
    get 'public/users/quit' => 'users#quit'
    resources :deliveries
    resources :cart_items
    delete 'public/carts_items' => 'carts_items#destroy_all'
    resources :orders
    get 'public/users/order/confirm' => 'orders#confirm'
    get 'public/users/order/success' => 'orders#success'

  end

  namespace :admin do
    devise_for :admins
    resources :genres
    resources :sweets
    resources :users
    resources :orders
    patch 'admin/orders/:id/order_details/:id' => 'order_details#update'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
