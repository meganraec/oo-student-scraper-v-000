require 'open-uri'
require 'pry'
require 'nokogiri'

class Scraper

  def self.scrape_index_page(index_url)
# is a class method that scrapes the student index page ('./fixtures/student-site/index.html') and a returns an array of hashes in which each hash represents one student
    index = Nokogiri::HTML(open(index_url))
    scraped_students = []
    cards = index.css('div.student-card')

    cards.collect do |card|
      scraped_students << {
        :name => card.css('h4.student-name').text,
        :location => card.css('p.student-location').text,
        :profile_url => ('./fixtures/student-site') + card.css('a').attribute('href').value
      }
      end
    scraped_students
  end

  def self.scrape_profile_page(profile_url)
# is a class method that scrapes a student's profile page and returns a hash of attributes describing an individual student
# can handle profile pages without all of the social links

    profile = Nokogiri::HTML(open(profile_url))
    attributes = {}

    profile.css('social-icon-container')
end
  #
  #   :twitter =>
  #   :linkedin =>
  #   :github =>
  #   :blog =>
  #   :profile_quote =>
  #   :bio => profile.css('div.description-holder p').text
  # end

end
