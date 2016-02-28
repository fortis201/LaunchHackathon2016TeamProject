class SessionsController < ApplicationController
	def new
	end

	def create
		@vendor = Vendor.find_by(email: params[:session][:email].downcase)

		if @vendor && @vendor.authenticate(params[:session][:password])
			log_in @vendor
			redirect_to vendor_path(@vendor)
		else
			redirect_to login_path
			flash[:notice] = @vendor.errors.full_messages
		end
	end

	def destroy
		log_out
		redirect_to login_path
	end
end
