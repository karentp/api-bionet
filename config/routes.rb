Rails.application.routes.draw do
  
  namespace :api, defaults: { format: JSON} do
    resources :lines, only: [:index, :create]
    resources :genes, only: [:index, :create]
    resources :datasources, only: [:index, :create]
    resources :experiments, only: [:index, :create]
  end
end
