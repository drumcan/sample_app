require "rubygems"
require "braintree"

Braintree::Configuration.environment = :sandbox
Braintree::Configuration.merchant_id = '6fwrg6ccn34c95qj'
Braintree::Configuration.public_key = 'v4mcvvzwz5cr33bz'
Braintree::Configuration.private_key = '106e3a1f1998579b6b1afb93e8491770'

class WebhooksController < ApplicationController

def webhooks
        challenge = request.params["bt_challenge"]
        challenge_response = Braintree::WebhookNotification.verify(challenge)
        render plain: challenge_response, status: 200
end
