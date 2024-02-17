Rails.application.routes.draw do
  devise_for :users


  root 'welcome#index'

  #設定 admin/products 的路徑(routes)
  namespace :admin do
    resources :products
    resources :orders do
      member do
        post :cancel
        post :ship
        post :shipped
        post :return
      end
    end
  end

  resources :products do
    #建立多個分類網頁
    collection do
      get :kirby
      get :monster_hunter
      get :super_smash_bros
      get :super_mario
      get :splatoon
      get :zelda_botw
      get :animal_crossing
    end

    member do
      post :add_to_cart
    end
  end

  resources :carts do #一鍵清空購物車 功能
    collection do
      delete :clean
      post :checkout
    end
  end

  resources :cart_items #刪除 購物車內 某一商品
  resources :orders do #建立結帳頁
    member do
      post :pay_with_alipay
      post :pay_with_wechat
      post :apply_to_cancel
    end
  end
  namespace :account do
    resources :orders
  end

end
