require 'nokogiri'
require 'open-uri'
require 'pry'

class Scraper

  def self.scrape_index_page(index_url)
    @index_page = []

    link = open(index_url)
    doc = Nokogiri::HTML(link)
    doc.css("div.student-card").each do |x|
      hash = {}
      hash[:name] = x.css("h4.student-name").text
      hash[:location] = x.css("p.student-location").text
      hash[:profile_url] = x.css("a").attr("href").value
      @index_page << hash
    end
    @index_page
  end

  def self.scrape_profile_page(profile_url)
    @profile = {}
    html = open(profile_url)
    doc = Nokogiri::HTML(html)
    doc.css("div.social-icon-container a").each do |x|
    
      link = x.attr("href")

    @profile[:twitter] = link if link.include?("twitter")
    @profile[:github] = link if link.include?("github")
    @profile[:linkedin] = link if link.include?("linkedin")
    @profile[:blog] = link if @profile.include?("link") == false


#     if x.css('a[href*="twitter"]') != nil
#       @profile[:twitter] = x.css('a[href*="twitter"]').attr("href").value
#     end
#     if x.css('a[href*="linkedin"]') != nil
#       @profile[:linkedin] = x.css('a[href*="linkedin"]').attr("href").value
#     end
#     if x.css('a[href*="github"]') != nil
#       @profile[:github] = x.css('a[href*="github"]').attr("href").value
#     end
#
#     if x.css('a img').attr("src").text.include?("rss")
#       binding.pry
#       @profile[:blog] = x.css('a').attr("href").value
#

#
# doc.css("div.social-icon-container").css('a img').attr("src").text
#

#
#     @profile[:profile_quote] = doc.css("div.profile-quote").text
#     @profile[:bio] = doc.css("div.description-holder p").text
end
end
end
