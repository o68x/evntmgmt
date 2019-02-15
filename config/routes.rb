Rails.application.routes.draw do
  devise_for :users
  resources :events do
    resources :attendances
    resources :pictures, only: [:create, :update]
  end
  get 'events/:id/admin/', to: 'events#admin'
  resources :users do
    resources :avatars, only: [:create]
  end

  namespace :admin do
    root 'admin#index'
    resources :users
    resources :events
  end

  root 'events#index'
end
