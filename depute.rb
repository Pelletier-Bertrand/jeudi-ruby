require 'rubygems'
require 'nokogiri'
require 'open-uri'

#http://www2.assemblee-nationale.fr/deputes/liste/alphabetique

def depute(website)
    page = Nokogiri::HTML(open(website))
    @depute=page.xpath('//*[@id="deputes-list"]/div/ul/li/a').map{|item| item.text} #@id="deputes-list"]/div/ul/li/a est le chemin commun pour récupérer le nom & prenom des deputés.
puts @depute
end
depute('http://www2.assemblee-nationale.fr/deputes/liste/alphabetique')

#exercice non fini.