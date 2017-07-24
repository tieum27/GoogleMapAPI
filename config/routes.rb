Rails.application.routes.draw do
  root 'condos#index'
  resources :condos
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
