Rails.application.routes.draw do
  get 'shifts/index'
 root to: "shifts#index"
end
