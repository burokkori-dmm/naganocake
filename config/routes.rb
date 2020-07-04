Rails.application.routes.draw do
  namespace :public do
    get 'orders/new'
    get 'orders/show'
    get 'orders/create'
    get 'orders/success'
  end
  namespace :admin do
    get 'order_details/update'
  end
  namespace :admin do
    get 'order/index'
    get 'order/show'
    get 'order/update'
  end
  devise_for :admins
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
