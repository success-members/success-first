Rails.application.routes.draw do
  devise_for :admins, controllers: { registrations: 'admin/registrations',
                                      sessions: 'admin/sessions' }

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

  resources :shipping_addresses
 


  # admin
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
