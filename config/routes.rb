Rails.application.routes.draw do
  get 'articles/index'
  resources :articles
  root to: 'articles#index'
  devise_for :users
   # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
