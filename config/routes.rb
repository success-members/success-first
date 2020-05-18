Rails.application.routes.draw do
  devise_for :admins
  devise_for :customers

  namespace :admins do
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :admin do
  	devise_for :admins
  root 'admins#top' #最初の画面をルートにて設定しています。
  end
end
