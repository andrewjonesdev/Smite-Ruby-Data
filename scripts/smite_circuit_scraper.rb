require 'open-uri'
require 'nokogiri'

url = 'http://tiermonster.events/'
page = Nokogiri::HTML(open(url))

page.css('.table.table-dark.table-condensed td').each do |line|
  puts line.text
end