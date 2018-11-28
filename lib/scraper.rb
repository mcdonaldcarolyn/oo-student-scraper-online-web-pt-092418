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
      linked = profile.at("a")["href"][1]
      binding.pry
      git = profile.at("a")["href"][0]
      face = profile.at("a")["href"][2]
      blog = profile.at("a")["href"][3]
      quote = profile.at(".profile-quote")
      bio = profile.at(".discription-holder")
      pro_col= {}
        pro_col[:linkedin] = linked
        pro_col[:github] = git
        pro_col[:blog] = blog
        pro_col[:profile_quote] = quote
        pro_col[:bio] = bio
        new_array.push(pro_col)
      end
    new_array
  end

end

