Rails.application.routes.draw do
  root 'users#index'

  resources :users do 
    get 'checkout' => 'users#checkout'
    get 'payment' => 'users#payment'
  end

  resources :vendors
end
