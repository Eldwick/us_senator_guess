# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'open-uri'

link = open("http://en.wikipedia.org/wiki/List_of_current_United_States_Senators")

doc = Nokogiri::HTML(link)

senator_table = doc.css("table:nth-of-type(5) tr")

senator_table.shift

senator_table.each do |senator_row|

  name = senator_row.css("td:nth-of-type(5) span:nth-of-type(2)")
  state = senator_row.css("td:nth-of-type(2)")
  image_url = senator_row.css("td:nth-of-type(4) img")[0][:src]
  wiki_url = "http://en.wikipedia.org" + senator_row.css("td:nth-of-type(5) a")[0][:href]
  senator_params = {
    name: name.text,
    state: state.text,
    image_url: image_url,
    wiki_url: wiki_url
  }
  Senator.create(senator_params)
end