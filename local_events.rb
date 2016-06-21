# your code, here.
require 'net/http'
require 'uri'
require 'json'

url = "https://api.seatgeek.com/2/venues?city="+ARGV[0]
uri = URI.parse("https://api.seatgeek.com/2/venues?postal_code=90210")
response = Net::HTTP.get_response(uri)

# res = JSON.parse(response.body, symbolize_names: true)
my_hash = JSON.parse(response.body, symbolize_names: true)
my_hash[:venues].each do |venue|
  puts venue[:city] + " @ " +  venue[:name]
end
