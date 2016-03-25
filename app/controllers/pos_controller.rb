class PosController < ApplicationController
	skip_before_filter :verify_authenticity_token
  def calculator
  end
  def create
  	session[:invoice] = params[:amount]
   	puts "\n\n\n\n\n\n"
  	puts session[:invoice]
  	puts "\n\n\n\n\n\n"

  end
  def checkout  
  	@amount = session[:invoice]
  end
  def payment
  	Transaction.create(vendor_id: session[:vendor_id], amount: params[:amount], currency: "USD")
  	redirect_to vendor_path(session[:vendor_id])
  end
end
