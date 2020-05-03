Rails.application.routes.draw do
 
  devise_for :users, path: 'admin/users'
  namespace :admin do
    get 'home/index'
    root 'home#index'

    resources :categories
    resources :companies
  end
  # root seria necessário criar uma página para receber o tipo de user e redirecionar
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
