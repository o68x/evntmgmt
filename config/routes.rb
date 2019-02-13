Rails.application.routes.draw do
  devise_for :users
  resources :events do
    resources :attendances
  end
  get 'events/:id/admin/', to: 'events#admin'
  resources :users
  root 'events#index'
end
