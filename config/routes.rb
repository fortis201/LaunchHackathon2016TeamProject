Rails.application.routes.draw do

<<<<<<< HEAD
 resources :vendors do
    collection do
      get :authenticate
      get :oauth_callback
    end
  end
  # root to: 'vendors#index'

  resources :users
    root 'users#index'
    get 'checkout' => 'users#checkout'
    get 'payment' => 'users#payment'

=======
  root 'users#index'
  
  resources :vendors
  resources :bitcoin_exchanges
  resources :users 
>>>>>>> a356bf5212536f23686e108bc0423e1f6c2b173c

  get 'checkout' => 'users#checkout'
  get 'payment' => 'users#payment'
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

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'users#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
