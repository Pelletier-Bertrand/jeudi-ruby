require 'rubygems'
require 'nokogiri'
require 'open-uri'


def obscur(website)
    page = Nokogiri::HTML(open(website))
    @values= page.xpath('//*[contains(@class,"no-wrap text-right")]').map{ |item| item["data-sort"]}.map{ |item| item="$#{item}"}
#puts values (pour moi..)
end
obscur('https://coinmarketcap.com/all/views/all/')


def obscur (web)
    page = Nokogiri::HTML(open(web))
    @name= page.xpath('//*[contains(@class,"currency-name-container link-secondary")]').map{|item| item.text}
    #puts name
end
obscur ('https://coinmarketcap.com/all/views/all/')

def zip
    array= @name.zip(@values)
p array
end
zip

#J'ai fais 2 def pour réccuper le nom et la valeur des cryptomonnaie. 
#J'ai une derniére def pour fusionner les deux.
