Rails.application.routes.draw do
  devise_for :users, controllers: {omniauth_callbacks: "omniauth_callbacks"}

  root 'condos#index'

  get 'admin/index'

  get 'admin/update'

  get "admin" => "admin#index"
  put "admin/:id" => "admin#update"
  patch "admin/:id" => "admin#update"

  resources :condos
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
