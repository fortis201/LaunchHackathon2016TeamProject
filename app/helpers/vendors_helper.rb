module VendorsHelper
	# Logs in the given vendor
	def log_in(vendor)
		session[:vendor_id] = vendor.id
	end

	#Logs out the given vendor
	def log_out
		session.delete(:vendor_id)
	end
end
