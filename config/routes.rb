Rails.application.routes.draw do
  resources :articles, except: [:destroy]
end
