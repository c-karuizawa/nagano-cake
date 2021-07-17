Rails.application.routes.draw do


# デバイスのカスタマーのルーティング
   devise_for :customers


   # 管理者　admin
     namespace :admin do
     # 管理者のセッション管理
      devise_for :admins, class_name: "Admin::Admin"
      # 商品のルーティング
      resources :items, only: [:new, :create, :edit, :update, :index, :show]
     # 注文のルーティング
      resources :orders, only: [:index, :show, :update]
     # 注文商品のルーティング
      resources :order_items, only: [:update]
     # 顧客情報
      resources :customers, only: [:index, :show, :edit, :update]
     # ジャンル
      resources :genres, only: [:index, :create, :edit, :update]
     end


   #顧客　customers

   # 商品のルーティング
   scope module: :public do
     root to: 'items#top'
     get '/about' => 'items#about'
     resources :items, only: [:index, :show]

     # カートのルーティング
     resources :cart_items, only: [:index, :create, :update, :destroy]
     delete '/all_destroy' => 'cart_items#all_destroy'

     # 注文のルーティング
     resources :orders, only: [:new, :create, :index, :show]
     post 'orders/confirm' => 'orders#confirm'
     get 'orders/done' => 'orders#done'

     # 顧客情報
     resources :customers, only: [:show, :edit, :update]
     get 'customers/unsubscribe/:id' => 'customers#unsubscribe', as: 'confirm_unsubscribe'
     patch ':id/customers/withdraw/:id' => 'customers#withdraw', as: 'withdraw_customer'
     put 'customers/withdraw/:id' => 'customers#withdraw'

     # 配送先のルーティング
     # 実装確認のために下記一時変更
     # resources :locations, only: [:index, :create, :edit ,:update, :destroy]
     get 'customers/:id/locations' => 'locations#index', as: 'locations'
     post 'customers/:id/locations' => 'locations#create'
     get 'customers/:id/locations/:id/edit' => 'locations#edit', as: 'edit_locations'
     patch 'customers/:id/locations' => 'locations#update'
     put 'customers/:id/locations/:id' => 'locations#update'
     delete 'customers/:id/locations' => 'locations#destroy'

   end
end
