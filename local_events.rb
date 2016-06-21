# your code, here.
require 'net/http'
require 'uri'
require 'json'

url = "https://api.seatgeek.com/2/venues?city="+ARGV[0]+"&datetime_local.gte="+ARGV[1]+"&datetime_local.lt="+ARGV[2]
print ARGV
print "\n"
print url + "\n"
uri = URI.parse(url)
print uri
response = Net::HTTP.get_response(uri)

# res = JSON.parse(response.body, symbolize_names: true)
my_hash = JSON.parse(response.body, symbolize_names: true)
my_hash[:venues].each do |venue|
  puts venue[:city] + " @ " +  venue[:name]
end
