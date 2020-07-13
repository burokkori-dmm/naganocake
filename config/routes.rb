Rails.application.routes.draw do
  namespace :admin do
    get 'homes/top'
  end
  namespace :admins do
    get 'homes/top'
  end
  devise_for :users, controllers: { sessions: 'public/users/sessions',
                                       registrations: 'public/users/registrations', 
                                       passwords: 'public/users/passwords' }
  devise_for :admins, controllers: { sessions: 'admin/admins/sessions' }

  namespace :public do
    get 'homes/top'
    get 'home/about'
  end
   root 'public/home#top'
   namespace :public do
    get 'home/about'
    resource :user
    get 'users/quit/:id' => 'users#quit'
    put "/users/:id/hide" => "users#hide", as: 'users_hide'
    resources :deliveries
    resources :sweets, only: [:index, :show]
    get 'sweets/search/:id' => 'sweets#search',as: 'sweet_search'
    resources :cart_items
    delete 'cart_items' => 'cart_items#destroy_all', as: 'cart_item_destroy_all'
    resources :orders, only: [:index, :show, :new, :create] do
    member do
      get :confirm
    end
  end
    get 'order/success' => 'orders#success'

  end

  namespace :admin do
    resources :genres
    resources :sweets
    resources :admins
    resources :orders
    resources :oreder_details, except: [:new, :create, :edit, :show, :destroy, :index]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
