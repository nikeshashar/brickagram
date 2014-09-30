Rails.application.routes.draw do

  devise_for :users

  resources :posts do 
    resources :charges
  end 

  resources :tags
  
  resources :orders
 
  root 'posts#index'
end
