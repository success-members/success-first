Rails.application.routes.draw do
  devise_for :admins
  devise_for :customers
  resources :products, only: [:index, :show]
  resources :cart_items, only: [:index, :create, :update, :destroy] do
  	collection do
  		delete 'destroy_all'
  	end
  end
  resources :orders, only: [:new, :index, :show, :create]
  root 'homes#top' #最初の画面をルートにて設定しています。
end
