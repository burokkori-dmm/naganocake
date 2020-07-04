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
  end
  devise_for :admins
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
