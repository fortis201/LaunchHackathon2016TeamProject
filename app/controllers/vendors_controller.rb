class VendorsController < ApplicationController
    def new
    end

    def show
        @vendor = Vendor.find(params[:id])
    end

    def create
        @vendor = Vendor.new(vendor_params)

        if @vendor.save
            log_in @vendor
            redirect_to vendor_path(@vendor)
        else
            flash[:notice] = @vendor.errors.full_messages 
            redirect_to new_vendor_path
        end
    end

    private

    def vendor_params
        params.require(:vendor).permit(:firstName, :lastName, :email, :businessName, :walletID, :password, :password_confirmation);
    end
end