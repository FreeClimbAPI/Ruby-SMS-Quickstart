require 'time'
require 'freeclimb'
require 'sinatra'
require 'dotenv'
require 'json'
require 'uri'

Dotenv.load('.env')

set :bind, '0.0.0.0'

set :port, 3000

uri = URI.parse(ENV['API_SERVER'] || "https://www.freeclimb.com/apiserver")

# setup authorization
Freeclimb.configure do |config|
  config.scheme = uri.scheme
  config.host = uri.host
  config.base_path = uri.path
  config.server_index = nil
  # Configure HTTP basic authorization: fc
  config.username = ENV['ACCOUNT_ID']
  config.password = ENV['API_KEY']
end

api_instance = Freeclimb::DefaultApi.new

post '/incomingSms' do
  # MessageRequest | Details to create a message
  data = JSON.parse(request.body.read)
  message_request = Freeclimb::MessageRequest.new({from: ENV['FREECLIMB_NUMBER'], to: data['from'], text: 'Hello, World!'}) 

  # Send an SMS Message
  result = api_instance.send_an_sms_message(message_request)
  p result
end