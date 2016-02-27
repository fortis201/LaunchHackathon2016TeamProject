class UsersController < ApplicationController
  def index
  end

  def create
  end

  def new
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def checkout
  end

  def payment

    puts "\n \n\n\n\n\n"
    puts params
    puts "\n \n\n\n\n\n"
    redirect_to "/checkout"
#     @payment = Payment.new({
#       :intent => "sale",
#       :payer => {
#         :payment_method => "credit_card",
#         :funding_instruments => [{
#           :credit_card => {
#             :type => "visa",
#             :number => "4567516310777851",
#             :expire_month => "11",
#             :expire_year => "2018",
#             :cvv2 => "874",
#             :first_name => "Joe",
#             :last_name => "Shopper",
#             :billing_address => {
#               :line1 => "52 N Main ST",
#               :city => "Johnstown",
#               :state => "OH",
#               :postal_code => "43210",
#               :country_code => "US" }}}]},
#       :transactions => [{
#         :item_list => {
#           :items => [{
#             :name => "item",
#             :sku => "item",
#             :price => "1",
#             :currency => "USD",
#             :quantity => 1 }]},
#         :amount => {
#           :total => "1.00",
#           :currency => "USD" },
#         :description => "This is the payment transaction description." }]})

# # Create Payment and return the status(true or false)
#     if @payment.create
#       @payment.id     # Payment Id
#       redirect_to '/'
#     else
#       @payment.error  # Error Hash
#     end
  end
end
