Rails.application.routes.draw do
  resources :issues, only: [:index, :create]
end
