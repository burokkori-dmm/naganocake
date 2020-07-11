Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'public/users/sessions',
                                       registrations: 'public/users/registrations', 
                                       passwords: 'public/users/passwords' }

  namespace :public do
    get 'homes/top'
    get 'homes/about'
  end
   root 'public/home#top'
   namespace :public do
    get 'home/about'
    resources :users
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
    devise_for :admins, controllers: { sessions: 'admin/admins/sessions',
                                       registrations: 'admin/admins/registrations', 
                                       passwords: 'admin/admins/passwords' }
    resources :genres
    resources :sweets
    resources :users
    resources :orders
    resources :oreder_details, except: [:new, :create, :edit, :show, :destroy, :index]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
