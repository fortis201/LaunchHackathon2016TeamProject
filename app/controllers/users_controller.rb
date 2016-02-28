class UsersController < ApplicationController
  skip_before_filter :verify_authenticity_token, :only => :payment

  def index
  end

  def create
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

  end

  def payment

  end
end
