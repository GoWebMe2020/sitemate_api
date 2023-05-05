Rails.application.routes.draw do
  root 'issues#index'
  resources :issues, only: [:index, :create, :update, :destroy]
end
