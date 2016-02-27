require 'coinbase/wallet'

class BitcoinExchangesController < ApplicationController
	
	before_action :set_client
	


	def index
		@accounts = @client.accounts
	end

	def create

		account = @client.primary_account
		payment_method = @client.payment_methods.first

		account.buy({ :amount => "0.001", :currency => "BTC", :payment_method => payment_method.id })

		redirect_to bitcoin_exchanges_path
	end




	private

		def set_client 
			@client = Coinbase::Wallet::Client.new(
				api_key: 'fd3olj8I3eHSMXBJ', 
				api_secret: 'u5iJm9ZESQ7Pdq38Xv7aFjUZkNSxoPfi', 
				api_url: "https://api.sandbox.coinbase.com"
			)
		end

		def exchange_params
			params.require(:exchange).permit(:amount, :description)
		end

end
