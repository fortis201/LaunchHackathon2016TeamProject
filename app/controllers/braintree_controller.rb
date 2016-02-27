class BraintreeController < ApplicationController
  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def getClientToken
    get "/client_token" do
    Braintree::ClientToken.generate
    end
  end

  def btCheckout
    puts "Now in btCheckout controller method"
    puts params
    # post "/checkout" do
      nonce = params[:payment_method_nonce]
      # Use payment method nonce here...
      result = Braintree::Transaction.sale(
        :amount => "10.00",
        :payment_method_nonce => fake-valid-nonce,
        :options => {
          :submit_for_settlement => true
        }
      )
      puts result
    # end
  end


end
