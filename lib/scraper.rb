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
    profile = site.css(".social-icon-container")[0]
    new_array = []
      also = site.css(".vital-text-container")
      quote = site.css(".profile-quote").first.text
      bio = site.css(".bio-content .description-holder p").first.text
      pro_col = {
        :profile_quote => quote,
        :bio => bio
      }
      atags = profile.css("a")
      atags.each do |atag|
        href = atag['href']
        if href.start_with?('https://twitter.com')
          pro_col[:twitter] = href
        elsif href.start_with?('https://www.linkedin.com')
          pro_col[:linkedin] = href
        elsif href.start_with?('https://github.com')
          pro_col[:github] = href
        else
          pro_col[:blog] = href
        end
      end      
    pro_col
  end

end

