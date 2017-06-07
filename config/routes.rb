Rails.application.routes.draw do

  devise_for :users
  resources :flicks do
    resources :reviews
  end
  root 'flicks#index'
end
