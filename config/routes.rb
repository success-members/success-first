Rails.application.routes.draw do
  devise_for :admins
  devise_for :customers
  resources :products, only: [:index, :show]
  root 'homes#top' #最初の画面をルートにて設定しています。
end
