Rails.application.routes.draw do
  devise_for :users
  root to: 'cafes#index'
  mount StripeEvent::Engine, at: '/stripe-webhooks'
   get '/users/:id/cafes/dashboard', to: 'cafes#dashboard', as: 'dashboard'
   get '/users/:id/cafes/analytics', to: 'cafes#analytics', as: 'analytics'
   get '/cafes/:cafe_id/users/:user_id/bookings/:id/check-in', to: "bookings#check_in", as: 'check_in'
   patch '/users/:user_id/cafes/:cafe_id/orders/:order_id', to: 'orders#mark_as_delivered', as: 'mark_as_delivered'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :bookings, only: [:show] do
    resources :payments, only: [:new]
    resources :orders, only: [:create]
  end
  resources :cafes, only: [ :index, :show ] do
    resources :users, only: [:show] do
      resources :bookings, only: [:new, :create, :show ] do
        resources :orders, only: [:new, :create]
      end
    end
  end
  resources :users, only: [ :show] do
    resources :bookmarks, only: [ :index, :create ]
    resources :cafes, only: [:index, :new, :create, :edit, :update, :destroy ] do
      resources :bookmarks, only: [:create, :destroy]
      resources :hourly_slots, only: [ :new, :create, :destroy ]
      resources :menu_items, only: [ :index, :create, :destroy ]
      resources :orders, only: [ :index ]
    end
    resources :bookings, only: [ :show, :index ] do
      resources :reviews, only: [ :new, :create ]
    end
  end
  resources :cafes do
    resources :bookmarks, only: [:create, :destroy]
  end
end

