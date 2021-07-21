Rails.application.routes.draw do


   # 管理者　admin
     namespace :admin do
     # 管理者のセッション管理
     devise_for :admins, skip: [:confirmations, :passwords, :registrations, :unlocks]
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
     resources :orders, only: [:new]
     post 'orders/confirm' => 'orders#confirm'
     post 'orders' => 'orders#create'
     get 'orders' => 'orders#index'
     get 'order/:id' => 'orders#show', as: 'show_order'
     get 'orders/done' => 'orders#done'

     # 顧客情報
     get 'customers/my_page' => 'customers#show'
     get 'customers/edit' => 'customers#edit'
     patch 'customers/edit' => 'customers#update'
     get 'customers/unsubscribe' => 'customers#unsubscribe'
     patch 'customers/withdraw' => 'customers#withdraw'

     # デバイスのカスタマーのルーティング
     devise_for :customers, controllers: {
         sessions: 'public/sessions',
         registrations: 'public/registrations'
       }

     # 配送先のルーティング
     get 'customers/locations' => 'locations#index', as: 'locations'
     post 'customers/locations' => 'locations#create'
     get 'customers/locations/:id/edit' => 'locations#edit', as: 'edit_locations'
     patch 'customers/locations/:id/edit' => 'locations#update'
     delete 'customers/locations/:id' => 'locations#destroy', as: 'destroy_locations'

   end



end
