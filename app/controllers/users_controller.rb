class UsersController < ApplicationController
  skip_before_filter :verify_authenticity_token, :only => :payment

  def index
  end

  def create
    puts "\n\n\n\n\n\n"
    puts params[:amount]
    puts "\n\n\n\n\n\n"
    session[:invoice] = params[:amount]
  end

  def new
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def checkout
    puts "/n/n/n/n"
    puts "in checkout"
    puts "/n/n/n/n"
    Braintree::Configuration.environment = :sandbox
    Braintree::Configuration.merchant_id = "8myzxsgwhfpcrd9p"
    Braintree::Configuration.public_key = "6hq8pv5sxfrhshcg"             
    Braintree::Configuration.private_key = "c2424239585948322c91e5da322f6da4"
    @token = Braintree::ClientToken.generate
    puts "/n/n/n/n"
    puts @token
    puts "/n/n/n/n"
    # render :json => @token.to_json


  end

  def payment
    puts "\n\n\n\n\n\n\n"
    puts "Now in payment method!"
    puts "\n\n\n\n\n\n\n"
    nonce = params[:payment_method_nonce]
    result = Braintree::Transaction.sale(
      :amount => session[:invoice],
      :payment_method_nonce => nonce,
      :options => {
        :submit_for_settlement => true
      }
    )
    puts "\n\n\n\n\n"
    puts result.transaction.amount
    puts "\n\n\n\n\n"

    redirect_to '/'
  end
end
