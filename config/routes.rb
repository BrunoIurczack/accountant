Rails.application.routes.draw do
  resources :customers do
    resources :payments, only: [] do
      get 'change_status_from_customer', on: :member
    end
  end

  resources :payments do
    member do
      get 'change_status'
    end
  end
  root to: 'customers#index'
end
