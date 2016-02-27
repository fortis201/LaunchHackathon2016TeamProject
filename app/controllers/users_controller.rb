class UsersController < ApplicationController
  def index
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
    # @clientToken = Braintree::ClientToken.generate
    # puts "logging client token from users#checkout..."
    # puts @clientToken
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
