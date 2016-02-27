require 'wepay'

class PaymentsController < ApplicationController
  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def wepay
    client_id = '157830'
    client_secret = '1cb823d52e'
    use_stage = true

    wepay = WePay::Client.new(client_id, client_secret, use_stage)

    # Get the OAuth 2.0 authorization URL. Send the user to this URL to authorize
    # the application, then they will return to your `redirect_uri` with a code as
    # a GET parameter.
    redirect_uri = "http://localhost:3000/"
    redirect_to(wepay.oauth2_authorize_url(redirect_uri))

    # Once you have the OAuth 2.0 code, you can request an access token.
    response = wepay.oauth2_token(code, redirect_uri)
    access_token = response['access_token']

    # Make a call to the `/user` endpoint (which requires no parameters).
    response = wepay.call('/user', access_token)

    # You may also open a payment account for the user.
    response = wepay.call('/account/create', access_token, {
      :name        => "test account",
      :description => "this is only a test"
    })
  end
end
