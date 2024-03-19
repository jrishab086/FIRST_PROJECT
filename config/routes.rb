Rails.application.routes.draw do
  resources :articles, except: [:destroy]
  namespace :api do
    resources :articles
  end
  resources :articles do
    resources :comments, only: [:create]
  end
end
