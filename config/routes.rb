Rails.application.routes.draw do
  root 'users#index'

  get "pos" => 'pos#calculator'
  get 'login'   => 'sessions#new'
  post 'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'
  get 'admin' => "bitcoin_exchanges#index"
  get 'documentation' => "bitcoin_exchanges#documentation"
  resources :bitcoin_exchanges
  resources :vendors do
    collection do
      get :authenticate
      get :oauth_callback
    end
  end

  get "/paymentForm.js" => "bitcoin_exchanges#sendPaymentForm"
  
  resources :bitcoin_exchanges

  post '/generate' => 'verifications#generate_code'
  post '/verify' => 'verifications#verify_code'
  post '/payment' => 'bitcoin_exchanges#payment'
  get '/checkout' => 'bitcoin_exchanges#checkout'
  get '/getInDogeCDN' => 'bitcoin_exchanges#sendPaymentForm'
  get 'documentation' => 'bitcoin_exchanges#documentation'
end