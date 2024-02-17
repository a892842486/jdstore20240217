Rails.application.routes.draw do
  devise_for :users
  root 'welcome#index'

  #設定 admin/products 的路徑(routes)
  namespace :admin do
    resources :products
  end

end
