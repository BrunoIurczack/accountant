Rails.application.routes.draw do
  resources :customers
  resources :payments do
    member do
      get 'change_status'
    end
  end
  root to: 'customers#index'
end
