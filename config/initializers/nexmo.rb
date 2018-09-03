require 'nexmo'

Nexmo::Client.new(
    api_key: ENV['NEXMO_API_KEY'],
    api_secret: ENV['NEXMO_API_SECRET']
)