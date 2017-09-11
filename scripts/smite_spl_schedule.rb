require 'open-uri'
require 'nokogiri'
require 'watir-webdriver'

OpenURI::Buffer.send :remove_const, 'StringMax' if OpenURI::Buffer.const_defined?('StringMax')
OpenURI::Buffer.const_set 'StringMax', 0
#OpenURI::Buffer::StringMax = 0

browser = Watir::Browser.start 'http://esports.smitegame.com/s4-fall-split-landing-page/'

sch = link(:text, 'Schedule').click
#encoded_url = URI.parse(URI.encode(url.strip))
#puts encoded_url
#page = Nokogiri::HTML(open(url))
#puts page
