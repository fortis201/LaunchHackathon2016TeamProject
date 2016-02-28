class PosController < ApplicationController
  def calculator
  end
  def create
  	session[:invoice] = params[:amount]
  end
end
