Rails.application.routes.draw do
  devise_for :users

  resources :movies, only: [:index, :create]
end
