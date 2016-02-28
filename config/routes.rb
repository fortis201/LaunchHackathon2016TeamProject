Rails.application.routes.draw do
  root 'users#index'
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'

  resources :users do
    get 'checkout' => 'users#checkout'
    get 'payment' => 'users#payment'
  end

  resources :vendors do
    collection do
      get :authenticate
      get :oauth_callback
    end
  end

  get 'login' => 'vendors#login'
  
  resources :bitcoin_exchanges

  get 'braintree/create'
  get 'braintree/edit'
  get 'braintree/update'
  get 'braintree/destroy'
  get 'braintree/getClientToken'
  get 'braintree/config'
  get 'payments/create'
  get 'payments/edit'
  get 'payments/update'
  get 'payments/destroy'
  get 'payments/wepay'
  post '/btCheckout' => 'braintree#btCheckout'
end