Rails.application.routes.draw do
  namespace :public do
    resources :orders
  end
  namespace :admin do
    resources :order_details
  end
  namespace :admin do
    resources :order
  end
  devise_for :admins
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
