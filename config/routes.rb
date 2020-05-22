Rails.application.routes.draw do
  devise_for :admins
  devise_for :customers


namespace :admin do
  	resources :products, only: [:new, :create, :index, :show, :edit, :update]
  	resources :orders, only: [:index, :show]
  	resources :order_products, only: [:index]
  	resources :genres, only: [:new, :create, :edit, :update]
    end

end
