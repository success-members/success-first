Rails.application.routes.draw do
  devise_for :admins
  devise_for :customers
  resources :products, only: [:index, :show]
  resources :cart_items, only: [:index, :create, :update, :destroy] do
  	collection do
  		delete 'destroy_all'
      patch 'update_number'
  	end
  end
  resources :orders, only: [:new, :index, :show, :create] do
    collection do
      post 'confirm'
      get 'thanks'
    end
  end
  root 'homes#top' #最初の画面をルートにて設定しています。


  resources :customers
  get 'withdrawal/:id' => 'customers#withdrawal',as:"withdrawal" 
  put "retire/:id" => "customers#update_retire", as: 'retire'
  
  get 'password/:id' => 'customers#password',as:"password" 
  put "change/:id" => "customers#change_password", as: 'change'

  get 'search' => 'search#search',as:'search'#検索機能実装のためのルート設定

  resources :shipping_addresses
 

end
