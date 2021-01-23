Rails.application.routes.draw do
  devise_for :users
  root to: "rooms#index"
  resources :rooms, only: [:new, :create, :show, :destroy, :edit, :update] do
    resources :shift_creators, only: [:new, :create]
    resources :schedules, only: [:new, :create, :show, :edit, :update] do
      resources :shifts, only: [:new, :create, :show]
    end
    member do
      get 'search'
    end
  end
  resources :users, only: [:show]
end
