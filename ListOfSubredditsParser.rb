require 'nokogiri'
require 'open-uri'
require 'csv'

# URL of the website
url = 'https://www.reddit.com/r/ListOfSubreddits/wiki/listofsubreddits/'
doc = Nokogiri::HTML(URI.open(url))

# Array to store names
subreddits = []

# Flag to indicate when to start parsing
start_parsing = false

# Extracting subreddit names from a specific CSS selector
doc.css('a[href^="/r/"]').each do |subreddit|
  # Checking if the current sub is the starting point.
  start_parsing = true if subreddit.text.strip == '/r/gifs'

  if start_parsing
    subreddits << [subreddit.text.strip]
  end
end

# Writing extracted data to a CSV file
CSV.open('subreddits.csv', 'w') do |csv|
  # Header row
  csv << ['SUBREDDIT NAME']

  # Writing subreddit names to CSV
  subreddits.each do |subreddit|
    csv << subreddit
  end
end

# Success messages
puts "Parsing of website #{url} was performed."
puts "Data successfully saved to subreddits.csv."
