Rails.application.routes.draw do
  devise_for :admins
  devise_for :customers

  root 'homes#top' #最初の画面をルートにて設定しています。

  resources :customers
  get 'withdrawal/:id' => 'customers#withdrawal',as:"withdrawal" 
  put "retire/:id" => "customers#update_retire", as: 'retire'
end
