require 'rubygems'
require 'yahoo_weatherman'

def get_location(location)
  client = Weatherman::Client.new
  weather = client.lookup_by_location(location).condition['temp']
end

puts "Enter a zipcode for a 5-day forecast: "

zipcode = gets

weather = get_location(zipcode)

if weather > 12
	puts "it's sunny"
elsif weather < 12
	puts "it's cold"
else
	puts "I don't know what it's like out there."
end

puts "your weather is #{weather}."

