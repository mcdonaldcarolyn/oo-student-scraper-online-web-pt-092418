class Student

  attr_accessor :name, :location, :twitter, :linkedin, :github, :blog, :profile_quote, :bio, :profile_url 

  @@all = []

  def initialize(student_hash)
    student_hash.keys.each do |key|
      self.send("#{key}=", student_hash[key])
    end
    @@all << self
  end

  def self.create_from_collection(students_array)
    student_array.each do |first, last|
      
    end  
    @@all << student_array
  end

  def add_student_attributes(attributes_hash)
    Scraper.new.attributes_hash
  end

  def self.all
    @@all
  end
end

