Rails.application.routes.draw do
<<<<<<< Updated upstream
  get 'rooms/index'
  get 'shifts/index'
 root to: "rooms#index"
=======
  devise_for :users
  root to: "rooms#index"
  resources :rooms, only: [:new, :create, :show, :destroy] do
    resources :schedules, only: [:new, :create, :show] do
      resources :shifts, only: [:new, :create]
    end
  end
  resources :users, only: [:show]
>>>>>>> Stashed changes
end
