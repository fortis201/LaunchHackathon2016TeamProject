Rails.application.routes.draw do
  get "pos" => 'pos#calculator'

  root 'users#index'
  post '/create' => "users#create"
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'

  resources :users
  resources :bitcoin_exchanges

  resources :vendors do
    collection do
      get :authenticate
      get :oauth_callback
    end
  end

  get 'login' => 'vendors#login'
  
  resources :bitcoin_exchanges

  post 'payment' => 'bitcoin_exchanges#payment'
  
  get 'checkout' => 'bitcoin_exchanges#checkout'
  get 'payment' => 'bitcoin_exchanges#payment'
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
end
