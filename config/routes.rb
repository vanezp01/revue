Rails.application.routes.draw do

  devise_for :users
  resources :flicks
  root 'flicks#index'
end
