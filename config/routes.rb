Rails.application.routes.draw do
  resources :articles, except: [:destroy]
  namespace :api do
    resources :articles
  end
end
