Rails.application.routes.draw do
  devise_for :users
  root 'products#index'

  #設定 admin/products 的路徑(routes)
  namespace :admin do
    resources :products
  end

  resources :products do
    member do
      post :add_to_cart
    end
  end

end
