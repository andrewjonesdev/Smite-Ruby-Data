require 'open-uri'
require 'nokogiri'

url = 'https://www.youtube.com/channel/UCDBofwsppusJeitUyKpkB5g/videos'
page = Nokogiri::HTML(open(url))

page.css('.yt-lockup-title').each do |line|
  puts line.text
end