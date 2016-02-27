class UsersController < ApplicationController
  def index
    @token = Braintree::ClientToken.generate
    puts "\n\n\n\n\n\n"
    puts session[:invoice]
    puts "\n\n\n\n\n\n"

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
