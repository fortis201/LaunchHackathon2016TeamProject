require 'coinbase/wallet'

class BitcoinExchangesController < ApplicationController
	skip_before_filter :verify_authenticity_token, :only => :payment
	before_action :set_client, :set_braintree

	rescue_from Timeout::Error, :with => :rescue_from_timeout
	
	def index
		@accounts = @client.accounts
		@price = @client.buy_price({currency: 'USD'})
	end

	def create
	end

  def checkout
  end

  def sendPaymentForm
  	render :file => 'path/to/file.js.erb'
  end

  def set_braintree
    Braintree::Configuration.environment = :sandbox
    Braintree::Configuration.merchant_id = "8mzgzs4th8ddkks8"
    Braintree::Configuration.public_key = "8b68q5s6f6tt96yb"             
    Braintree::Configuration.private_key = "7ef636e41c78248848b9c6e4b492d38a"
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
    # puts 'Payment successful! Thank you for using Dollar Bank Club!'
    puts 'Credit transaction successful with, value: #{result.transaction.amount.to_s} USD.'
    puts "\n\n"

    account = @client.primary_account
		payment_method = @client.payment_methods.first

		# @dollars_to_exchange = result.transaction.amount
		@dollars_to_exchange = 50.75
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

  def documentation
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
