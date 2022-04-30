Rails.application.routes.draw do

  # 顧客用
# URL /customers/sign_in ...
devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

# 管理者用
# URL /admin/sign_in ...
devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}


  namespace :admin do
    resources :sessions, only: [:new, :create, :destroy]
    resources :items, except: [:destroy]
    resources :genres, except: [:new, :show, :destroy]
    resources :customers, except: [:new, :create, :destroy]
    resources :orders, only: [:show, :update]
    resources :order_details, only: [:update]
  end
  namespace :admin do
    get 'homes/top'
    root to: "homes#top"
  end

  namespace :public do
    resources :items, only: [:index, :show]
    resources :registraitions, only: [:new, :create]
    resources :sessions, only: [:new, :create, :destroy]
    resource :customers, only: [:show, :edit, :update]
    resources :cart_items, only: [:index, :update, :create, :destroy]
    resources :orders, only: [:new, :create, :index, :show]
    resources :addresses, except: [:new, :show]
  end
  namespace :public do
    get 'homes/top'
    get 'homes/about'
   end

end
