require 'open-uri'
require 'nokogiri'

url = 'https://en.wikipedia.org/wiki/List_of_current_NBA_team_rosters'
page = Nokogiri::HTML(open(url))

#for teams -> puts page.css('li.toclevel-3').text

#for players -> puts page.css('td[style="text-align:left;"]').text

#for teams line breaks ->
page.css('li.toclevel-3').each do |line|
  puts line.text
end

#for teams line breaks ->
page.css('td[style="text-align:left;"]').each do |line|
  puts line.text
end