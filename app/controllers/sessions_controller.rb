class SessionsController < ApplicationController
	def new
	end

	def create
		@vendor = Vendor.find_by(email: params[:session][:email].downcase)
		
		if @vendor && @vendor.authenticate(params[:session][:password])
			redirect_to vendor_path(@vendor)
		else
			redirect_to login_path
		end
	end
end
