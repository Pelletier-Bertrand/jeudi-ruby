require 'rubygems'
require 'nokogiri'
require 'open-uri'


def get_the_email_of_a_townhal_from_its_webpage(web_site)
    page = Nokogiri::HTML(open(web_site))   
    email= page.xpath('/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]').text
    puts email
end
get_the_email_of_a_townhal_from_its_webpage("http://annuaire-des-mairies.com/95/vaureal.html")

def get_the_email_of_a_townhal_from_its_webpage_return(web_site)
   page = Nokogiri::HTML(open(web_site))
   email = page.xpath('//td[contains(text(), "@")]')  #on récupére les email en cherchant les @.
   return email.text
end


def get_all_the_urls_of_val_doise_townhalls(web_site)
   page = Nokogiri::HTML(open(web_site))
   url = page.xpath('//p/a').map {|link| link["href"]}.compact.map{|content| content = "http://annuaire-des-mairies.com#{content[1..-1]}"} #récupére la liste des url.
   mairie = page.xpath('//p/a').map {|link| link.text}.compact #récupére la liste des mairies. 
   mairies=Array.new #on créer un array vide des mairies.
   emails=Array.new #on créer un array vide des emails des mairies
   n=0
   while n < mairie.length #nous permet de créer une boucle.
    mairies << "Mairie: #{mairie[n]}" #on ajoute à notre arrêt "mairies" vide le nom des mairies.
       emails << "Email: #{get_the_email_of_a_townhal_from_its_webpage_return(url[n])}" #on ajoute à notre arrêt "mails" tous les mails des mairies à partir des.
       n+=1 
   end
   result = mairies.zip(emails) 
   print result
end

get_all_the_urls_of_val_doise_townhalls("http://annuaire-des-mairies.com/val-d-oise.html")



