class Vendor < ActiveRecord::Base
	has_secure_password

	has_many :transactions
end
