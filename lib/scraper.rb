require 'open-uri'
require 'pry'
#require_relative './fixtures/student-site/index.html'


class Scraper

  def self.scrape_index_page(index_url)
   html = open(index_url)
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
    profile.each do |profile|
      atags = profile.css("a")
      git = atags[0]["href"]
      linkedin = atags[1]["href"]
      blog = 
      also = site.css(".vital-text-container")
      quote = also.css(".profile-quote")
      bio_get = site.css(".detail-container")
      bio = bio_get.css(".description-holder p")
      pro_col= {}
        pro_col[:github] = git
        pro_col[:linkedin] = linkedin
        pro_col[:blog] = blog
        pro_col[:profile_quote] = quote
        pro_col[:bio] = bio
        new_array.push(pro_col)
      end
    new_array
  end

end

