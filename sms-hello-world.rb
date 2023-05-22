require 'time'
require 'freeclimb'
require 'sinatra'
require 'dotenv'
require 'json'

Dotenv.load('.env')

set :port, 3000

# setup authorization
Freeclimb.configure do |config|
  # Configure HTTP basic authorization: fc
  config.username = ENV['ACCOUNT_ID']
  config.password = ENV['API_KEY']
end

api_instance = Freeclimb::DefaultApi.new

post '/incomingSms' do
  # MessageRequest | Details to create a message
  data = JSON.parse(request.body.read)
  message_request = Freeclimb::MessageRequest.new({from: 'YOUR_FREECLIMB_NUMBER', to: data['from'], text: 'Hello World!'}) 

  # Send an SMS Message
  result = api_instance.send_an_sms_message(message_request)
  p result
end