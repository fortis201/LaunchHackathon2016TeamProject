require 'coinbase/wallet'

class BitcoinExchangesController < ApplicationController
	
	before_action :set_client
	
	def index
		@accounts = @client.accounts
		@price = @client.buy_price({currency: 'USD'})
	end

	def create
		account = @client.primary_account
		payment_method = @client.payment_methods.first

		@dollars_to_exchange = 10.00 # TODO : get from charge transaction
		@price = @client.buy_price({currency: 'USD'})
		@bitcoin_to_buy = @dollars_to_exchange / @price.amount

		account.buy({ :amount => @bitcoin_to_buy, :currency => "BTC", :payment_method => payment_method.id })

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
