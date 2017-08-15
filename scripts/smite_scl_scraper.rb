require 'open-uri'
require 'nokogiri'

url = 'http://esports.smitegame.com/scl-landing-page/'
page = Nokogiri::HTML(open(url))

page.css('.overview-wrapper td').each do |line|
  puts line.text
end

page.css('.overview-wrapper td a img').map do |image|
  puts image['src']
end

page.css('.overview-wrapper td a').map do |link|
  puts link['href']
  urlTeam =link['href']
  pageTeam = Nokogiri::HTML(open(urlTeam))
  pageTeam.css('div.player-card').each do |captain|
    captain.to_s.include?("captain-icon ion-star") ? (puts "true") : (puts "false")
  end
  pageTeam.css('div.player-card a').map do |plink|
    puts plink['href']
    urlPlayer =plink['href']
    pagePlayer = Nokogiri::HTML(open(urlPlayer))
    puts pagePlayer.css('div.player-tag p').first.text
    puts pagePlayer.css('div.player-name p').first.text
    pagePlayer.css('div.role img').map do |pimage|
      puts pimage['src']
      break
    end
    puts pagePlayer.css('div.role p').first.text
    age = pagePlayer.css('div.player-age p').first
    puts "%s" % [age ? age.text : "0"]
    #if pagePlayer.css('div.player-age p').first.nil?
    #  puts "N/A"
    #else
    #  puts pagePlayer.css('div.player-age p').first.text
    #end
    location = pagePlayer.css('div.player-location p').first
    puts "%s" % [location ? location.text : "N/A"]
    pagePlayer.css('div.social-media div[class="social twitch"] a').map do |plink|
      puts plink['href']
      break
    end
    pagePlayer.css('div.social-media div[class="social twitter"] a').map do |plink|
      puts plink['href']
      break
    end
    puts pagePlayer.css('div.main-content div.player-bio-wrapper p').text
    pagePlayer.css('div.statistics-wrapper table.statistics-table td').map do |ptable|
      puts ptable.text
    end

    pagePlayer.css('div.player-card div.player-image img').map do |pimage|
      puts pimage['src']
    end
    pagePlayer.css('div.top-gods-wrapper table.top-gods-table td img').map do |ptable|
      puts ptable['src']
    end
    pagePlayer.css('div.top-gods-wrapper table.top-gods-table td').map do |ptable|
      puts ptable.text
    end
  end
end