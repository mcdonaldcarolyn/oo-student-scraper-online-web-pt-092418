require 'open-uri'
require 'pry'
#require_relative './fixtures/student-site/index.html'


class Scraper

  def self.scrape_index_page(index_url)
   html = 
     site = Nokogiri::HTML(html)
    student = site.css(".student-card")
    new_array =[]
    student.each do |human|
      name = human.css(".card-text-container .student-name").text
      location = human.css(".card-text-container .student-location").text      
      url = human.at("a")["href"]
    collection = {}
    
    collection[:name] = name
    collection[:location] = location
    collection[:profile_url] = url
    new_array.push(collection)
    
    end
    new_array
  end

  def self.scrape_profile_page(profile_url)
    html = open(profile_url)
    site = Nokogiri::HTML(html)
    profile = site.css(".social-icon-container")
    new_array = []
    profiles.each do |profile|
      linked = profile.at("a")["href"]
    end
  end

end

