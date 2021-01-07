Rails.application.routes.draw do
  devise_for :users
  get 'shifts/index'
 root to: "shifts#index"
end
