Rails.application.routes.draw do
  root 'users#index'
  get "pos" => 'pos#calculator'

  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'
  get 'admin' => "bitcoin_exchanges#index"
  resources :bitcoin_exchanges
  get 'sign_up' => 'vendors#new'

  resources :vendors do
    collection do
      get :authenticate
      get :oauth_callback
    end
  end

  post '/generate' => 'verifications#generate_code'
  post '/verify' => 'verifications#verify_code'
  
  resources :bitcoin_exchanges

  post 'payment' => 'bitcoin_exchanges#payment'
  
  get 'checkout' => 'bitcoin_exchanges#checkout'
  get 'payment' => 'bitcoin_exchanges#payment'
 
  get 'documentation' => 'bitcoin_exchanges#documentation'
end
