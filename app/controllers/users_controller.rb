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
  end

  def payment
    puts "in payment controller";
    puts params;
    if params.email
      redirect_to '/'
    else
      puts "cannot redirect because email is invalid."
    end
  end
end
