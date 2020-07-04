Rails.application.routes.draw do
  namespace :public do
    get 'users/new'
  end
  namespace :admin do
    get 'admins/new'
  end
  namespace :admin do
    get 'users/new'
  end
  devise_for :admins
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
