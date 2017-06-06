Rails.application.routes.draw do

  resources :flicks
  root 'flicks#index'
end
