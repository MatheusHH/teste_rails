Rails.application.routes.draw do
 
  devise_for :company_users, path: 'company/users'
  devise_for :users, path: 'admin/users'
  namespace :admin do
    get 'home/index'
    root 'home#index'

    resources :update_company_user, only: [:edit, :update]

    resources :categories
    resources :companies do
      resources :company_users
    end
  end

  namespace :company do
    get 'home/index'
    root 'home#index'

    resources :edit_password, only: [:edit, :update]
  end

  namespace :api do 
    namespace :v1 do
      get 'companies/index'
      get 'categories/index'
    end
  end
  # root seria necessário criar uma página para receber o tipo de user e redirecionar
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
