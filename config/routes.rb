Rails.application.routes.draw do

   root 'public/home#top'
   namespace :public do
    devise_for :users
    get 'home/about'
    resources :deliverys
    resources :cart_items
    resources :orders
    get 'public/users/order/confirm' => 'public/orders#confirm'
    get 'public/users/order/success' => 'public/orders#success'
    get 'public/users/quit' => 'public/users#quit'
    delete 'public/carts_items' => 'public/carts_items#destroy_all'
  end

  namespace :admin do
    devise_for :admins
    resources :genres
    resources :sweets
    resources :users
    resources :orders
    patch 'admin/orders/:id/order_details/:id' => 'admin/order_details#update'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
