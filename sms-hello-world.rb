require 'time'
require 'freeclimb'
require 'sinatra'
require 'dotenv'
require 'json'

Dotenv.load('.env')

set :port, 3000

# Setup authorization
Freeclimb.configure do |config|
  config.username = ENV['ACCOUNT_ID']
  config.password = ENV['API_KEY']
end

api_instance = Freeclimb::DefaultApi.new

post '/incomingSms' do
  # Parse the incoming JSON
  data = JSON.parse(request.body.read)

  # Extract 'from' phone number from the incoming data
  from_number = data['from']

  # MessageRequest | Details to create a message
  message_request = Freeclimb::MessageRequest.new({
    from: 'YOUR_FREECLIMB_NUMBER', # Replace with your FreeClimb number
    to: from_number,
    text: 'Hello World!'
  })

  # Send an SMS Message
  result = api_instance.send_an_sms_message(message_request)
  p result
end
