Rails.application.routes.draw do
  get 'rooms/index'
  get 'shifts/index'
 root to: "rooms#index"
end
