require 'nokogiri'

slashdot_articles = []
File.open("slashdot.xml", "r") do |f|
  doc = Nokogiri::XML(f)
  slashdot_articles = doc.css('item').map { |i|
    {
      title: i.at_css('title').content,

      link: i.at_css('link').content,

    }
  }
end

slashdot_articles[0].each {|k,v| p v }
