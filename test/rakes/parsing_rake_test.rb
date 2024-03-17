require "test_helper"
require 'nokogiri'
require 'open-uri'
require 'csv'

class ParsingTest < ActiveSupport::TestCase
  def categories_to_hash
    csv_file_path = 'categories.csv'
    csv_data = []
    CSV.foreach(csv_file_path, headers: false) do |row|
      csv_data << row
    end
    csv_data
  end

  test "parsing categories from Reddit" do

    url = 'https://www.reddit.com/r/ListOfSubreddits/wiki/listofsubreddits/'

    category_names = categories_to_hash

    expected_quantity = 13
    real_quantity = 0
    doc = Nokogiri::HTML(URI.open(url))
    doc.css('h1[id]').each do |header|
      if header['id']
        real_quantity += 1
        category_name = header.text.strip
        Category.find_or_create_by(name: category_name)
      end
    end
    assert(expected_quantity == real_quantity, "Parsed ")

    category_names.each do |category_name|
      unless Category.find_by(name: category_name)
        flunk "Категорія #{category_name} не знайдена в базі даних"
      end
    end
  end
end
