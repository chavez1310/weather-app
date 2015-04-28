require 'rubygems'
require 'yahoo_weatherman'

def get_location(location)
  client = Weatherman::Client.new
  weather = client.lookup_by_location(location)
end

def fahrenheit(c)
  f = c * 2 + 30
end

print "Enter a zipcode for a 5-day forecast: "

zipcode = gets

weather = get_location(zipcode)

today = Time.now.strftime('%w').to_i

weather.forecasts.each do |forecast|

  day = forecast['date']

  weekday = day.strftime('%w').to_i

  high = fahrenheit(forecast['high'])
  low = fahrenheit(forecast['low'])

  if weekday == today
    dayName = 'Today'
  elsif weekday == today + 1
    dayName = 'Tomorrow'
  else
    dayName = day.strftime('%A')
  end

  puts "#{dayName}: #{forecast['text']} with a low of #{low} and a high of #{high}"

end