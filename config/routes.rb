Rails.application.routes.draw do
     # devise_for :customers
     

   # admin
     namespace :admin do
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
     
     
   #customers
   
   # 商品のルーティング
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
     
     # 配送先のルーティング
     resources :locations, only: [:index, :create, :edit ,:update, :destroy]
end
