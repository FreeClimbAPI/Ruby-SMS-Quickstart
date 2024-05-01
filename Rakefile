desc 'Start server'
task :start do
    require 'dotenv'
    Dotenv.load('.env')

    if ENV['ACCOUNT_ID'].nil? || ENV['API_KEY'].nil? || ENV['FREECLIMB_NUMBER'].nil?
        puts "ERROR: ENVIRONMENT VARIABLES ARE NOT SET. PLEASE SET ALL ENVIRONMMENT VARIABLES AND RETRY."
        exit 1
    end

    puts "\nWelcome to FreeClimb!\n\n"
    puts "Your web server is listening at http://127.0.0.1:3000"
    puts "Your NEXT STEP is to use NGROK to proxy HTTP traffic to this local web server."
    puts "\t1. In NGROK, configure the dynamic url to proxy to http://127.0.0.1:3000"
    puts "\t2. Using the Dashboard or API, set your FreeClimb Application SMS Url to the dynamic endpoint NGROK generated\n\n"

    %x[ruby server.rb]
end