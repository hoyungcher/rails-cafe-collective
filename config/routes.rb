Rails.application.routes.draw do
  devise_for :users
  root to: 'cafes#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :cafes, only: [ :index, :show ] do
    resources :users, only: [:show] do
      resources :bookings, only: [:new, :create, :show ] do
        resources :orders, only: [:create]
      end
    end
  end
  resources :users, only: [ :show] do
    resources :bookmarks, only: [ :index, :create ]
    resources :cafes, only: [ :new, :create, :edit, :update, :destroy ] do
      resources :bookmarks, only: [:create, :destroy]
      resources :hourly_slots, only: [ :new, :create, :destroy ]
    end
    resources :bookings, only: [ :show, :index ] do
      resources :reviews, only: [ :new, :create, ]
    end
  end

  resources :cafes do
    resources :bookmarks, only: [:create, :destroy]
  end
end

