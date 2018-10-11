require 'rubygems'

require 'nokogiri'

require 'open-uri'



def get_all_the_urls_of_val_doise_townhalls

  page = Nokogiri::HTML(open("http://annuaire-des-mairies.com/val-d-oise.html"))

  links = page.css("a.lientxt")

  links.each { |link| get_the_email_of_a_townhal_from_its_webpage(link['href'].delete_prefix(".")) }

end



def get_the_email_of_a_townhal_from_its_webpage(href)

  page = Nokogiri::HTML(open("http://annuaire-des-mairies.com#{href}"))

  email = page.css('tr.txt-primary.tr-last td')[7].text

  puts email

end



get_all_the_urls_of_val_doise_townhalls


