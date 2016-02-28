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
  	puts "\n\n\n\n\n\n"
  	puts params
  	puts "\n\n\n\n\n\n"
  	redirect_to "/pos"
  end
end
