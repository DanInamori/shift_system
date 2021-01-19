Rails.application.routes.draw do
  devise_for :users
  root to: "rooms#index"
  resources :rooms, only: [:new, :create, :show, :destroy] do
    resources :shift_creators, only: [:new, :create]
    resources :schedules, only: [:new, :create, :show] do
      resources :shifts, only: [:new, :create]
    end
    member do
      get 'search'
    end
  end
  resources :users, only: [:show]
end
