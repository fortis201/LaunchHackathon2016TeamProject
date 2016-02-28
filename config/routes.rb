Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root 'users#index'
  get "pos" => 'pos#calculator'

  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'

  resources :bitcoin_exchanges
  get 'sign_up' => 'vendors#new'

  resources :vendors do
    collection do
      get :authenticate
      get :oauth_callback
    end
  end

  
  resources :bitcoin_exchanges

  post '/generate' => 'verifications#generate_code'
  post '/verify' => 'verifications#verify_code'
  post '/payment' => 'bitcoin_exchanges#payment'
  get '/checkout' => 'bitcoin_exchanges#checkout'

  get 'documentation' => 'bitcoin_exchanges#documentation'
end
