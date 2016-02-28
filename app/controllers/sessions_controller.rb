class SessionsController < ApplicationController
	def new
	end

	def create
		@vendor = Vendor.find_by(email: params[:session][:email].downcase)

		puts 'vendor is : '
		puts @vendor

		if @vendor && @vendor.authenticate(params[:session][:password])

			puts 'vendor found and authenticated'

			log_in @vendor
			redirect_to vendor_path(@vendor)
		else

			puts params

			puts 'something failed'

			@vendor = Vendor.new

			if @vendor.save
				#success
			else #failure
				#redirect
				redirect_to login_path
				flash[:notice] = @vendor.errors.full_messages
			end

		end
	end

	def destroy
		log_out
		redirect_to login_path
	end
end
