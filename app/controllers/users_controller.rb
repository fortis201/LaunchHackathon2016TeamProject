class UsersController < ApplicationController
  def index
    @token = Braintree::ClientToken.generate
  end

  def create
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
    nonce = params[:payment_method_nonce]
    result = Braintree::Transaction.sale(
      :amount => "100.00",
      :payment_method_nonce => nonce,
      :options => {
        :submit_for_settlement => true
      }
    )
    puts "\n\n\n\n\n"
    puts result[:Braintree]
    puts "\n\n\n\n\n"

  end

  def payment

    puts "in payment controller"
    puts params
    redirect_to '/'
    # if params.email
    #   redirect_to '/'
    # else
    #   puts "cannot redirect because email is invalid."
    # end
  end
end
