Rails.application.routes.draw do
  devise_for :admins
  devise_for :customers

  root 'homes#top' #最初の画面をルートにて設定しています。

  resources :customers
  
end
