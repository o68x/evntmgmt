Rails.application.routes.draw do
  devise_for :users
  resources :events do
    resources :attendances
    resources :pictures, only: [:create]
  end
  get 'events/:id/admin/', to: 'events#admin'
  resources :users do
    resources :avatars, only: [:create]
  end
  root 'events#index'
end
