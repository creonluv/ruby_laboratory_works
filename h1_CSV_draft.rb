require 'nokogiri'
require 'open-uri'
require 'csv'


url = 'https://www.reddit.com/r/ListOfSubreddits/wiki/listofsubreddits/'
doc = Nokogiri::HTML(URI.open(url))

# Array to store names
categories = []


doc.css('h1[id]').each do |header|

  if header['id']
    header_text = header.text.strip
    categories << [header_text]
  end
end

# Writing extracted data to a CSV file
CSV.open('categories.csv', 'w') do |csv|



  # Writing category names to CSV
  categories.each do |category|
    csv << category
  end
end

# Success messages
puts "Parsing of website #{url} was performed"
puts "Data successfully saved to categories.csv"
