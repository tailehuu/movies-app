Rails.application.routes.draw do
  resources :movies, only: [:index, :create]
  resources :registration, only: :create
  resources :session, only: [] do
    collection do
      post :sign_in
      post :sign_out
    end
  end
end
