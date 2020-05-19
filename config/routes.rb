Rails.application.routes.draw do
  devise_for :admins
  devise_for :customers
  resources :products, only: [:index, :show]
  resources :cart_items, only: [:index, :create, :update, :destroy]
  root 'homes#top' #最初の画面をルートにて設定しています。


  resources :customers
  get 'withdrawal/:id' => 'customers#withdrawal',as:"withdrawal" 
  put "retire/:id" => "customers#update_retire", as: 'retire'

  resources :shipping_addresses
 

end
