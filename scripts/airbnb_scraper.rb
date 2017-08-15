require 'open-uri'
require 'nokogiri'

url = 'https://www.airbnb.com/s/Brooklyn--NY--United-States/'
page = Nokogiri::HTML(open(url))

puts page