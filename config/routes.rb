Rails.application.routes.draw do
  devise_for :admins
  devise_for :customers

  namespace :admin do
  	resources :customers, only: [:index, :show, :edit, :update]
  	resources :genres, only: [:new, :create, :edit, :update]
  	resources :products, only: [:new, :create, :index, :show, :edit, :update]
  	resources :orders, only: [:index, :show]
  	resources :order_products, only: [:index]
    get 'top' => 'homes#top'
    end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :admin do
  	devise_for :admins
  root 'admins#top' #最初の画面をルートにて設定しています。
  end
end
