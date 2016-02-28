class Vendor < ActiveRecord::Base
	before_save :downcase_email
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, presence: true, length: { maximum: 255 },
	                format: { with: VALID_EMAIL_REGEX },
	                uniqueness: { case_sensitive: false }
	has_secure_password
	validates :password,  presence: true, allow_nil: true

	# Converts email to all lower-case
	def downcase_email
		self.email = email.downcase
	end

	has_many :transactions
end
