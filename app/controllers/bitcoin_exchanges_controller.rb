require 'coinbase/wallet'

class BitcoinExchangesController < ApplicationController
	skip_before_filter :verify_authenticity_token, :only => :payment
	before_action :set_client

	rescue_from Timeout::Error, :with => :rescue_from_timeout
	
	def index
		@accounts = @client.accounts
		@price = @client.buy_price({currency: 'USD'})
	end

	def create
	end

  def checkout
    Braintree::Configuration.environment = :sandbox
    Braintree::Configuration.merchant_id = "8myzxsgwhfpcrd9p"
    Braintree::Configuration.public_key = "6hq8pv5sxfrhshcg"             
    Braintree::Configuration.private_key = "c2424239585948322c91e5da322f6da4"
    @token = Braintree::ClientToken.generate
  end

  def payment
    nonce = params[:payment_method_nonce]

    puts "\n\n"
    puts "Begining credit transaction."
    puts "\n\n"

    result = Braintree::Transaction.sale(
      :amount => "11.50",
      :payment_method_nonce => nonce,
      :options => {
        :submit_for_settlement => true
      }
    )

    puts "\n\n"
    puts 'Credit transaction successful with, value: + ' + result.transaction.amount.to_s + ' USD.'
    puts "\n\n"

    account = @client.primary_account
		payment_method = @client.payment_methods.first

		@dollars_to_exchange = result.transaction.amount
		@price = @client.buy_price({currency: 'USD'})
		@bitcoin_to_buy = @dollars_to_exchange / @price.amount

		puts "\nConducting bitcoin transaction via Coinbase.\n"

		account.buy({ :amount => @bitcoin_to_buy, :currency => "BTC", :payment_method => payment_method.id })

		puts "\nTransferring " + @bitcoin_to_buy.to_s + "bitcoin to customer's wallet.\n"

  	@transaction = @client.primary_account.send({ 
  		:to => 'fortis201@gmail.com', 
  		:amount => '0.001', 
  		:currency => 'BTC' })

  	puts 'Transaction complete.'
  	puts @transaction

  	puts 'Redirecting to {callback}.'

		redirect_to bitcoin_exchanges_path(@bitcoin_exchange)
  end


  protected

	  def rescue_from_timeout(exception)
	    puts "timeout: "
	    puts exception
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

		rescue_from Timeout::Error, :with => :rescue_from_timeout

end
