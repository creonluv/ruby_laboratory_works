#To add 'nokogiri' and 'open-uri' to gemfile

task :parse_categories => :environment do
  url = 'https://www.reddit.com/r/ListOfSubreddits/wiki/listofsubreddits/'
  doc = Nokogiri::HTML(URI.open(url))

  doc.css('h1[id]').each do |header|
    if header['id']
      category_name = header.text.strip
      Category.find_or_create_by(name: category_name)
    end
  end

  puts "Parsing of website #{url} was performed."
  puts "Data successfully saved to Category model."
end
