class VendorsController < ApplicationController
    def new
    end

    def show
        @vendor = Vendor.find(params[:id])
    end

    def create
        @vendor = Vendor.new(vendor_params)

        if @vendor.save
            puts 'vendor saved'
            log_in @vendor
            redirect_to vendor_path(@vendor)
        else
            puts 'vendor did not save'
            puts @vendor.errors.full_messages
            flash[:notice] = @vendor.errors.full_messages 
            redirect_to new_vendor_path
        end

        puts 'something bad happened'
    end

    private

    def vendor_params
        params.require(:vendor).permit(:email, :businessName, :walletID, :password, :password_confirmation);
    end
end