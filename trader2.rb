require 'rubygems'
require 'nokogiri'
require 'open-uri'


PAGE_URL = "https://coinmarketcap.com/all/views/all//"

def crypto

  page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))
  price = page.css("a.price")
  coin = page.css("a.currency-name-container.link-secondary")

coin_list = []

  coin.each do |link|
  totalname = link.text 
  coin_list << totalname
  end
value_list = []

  price.each do |value|
  totalvalue = value.text	
  value_list << totalvalue
  end

hash = Hash[coin_list.zip(value_list)]
puts hash.map {|array1,array2|{:name => array1, :price => array2}}
end 

crypto 


def bonus 
while true
  crypto
  sleep 3600
end
end

		# Lancer la def bonus pour activer la répétition du programme 
		# en boucle avec mise a jour toutes les heures