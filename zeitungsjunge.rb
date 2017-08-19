#! /usr/bin/env/ ruby

require 'rss'
require 'open-uri'
require 'colorize'


# add any rss-feed you like
url = 'http://www.faz.net/rss/aktuell/feuilleton'
open(url) do |rss|
  feed = RSS::Parser.parse(rss)
  puts "Title: #{feed.channel.title}"
  feed.items.each do |item|
    puts "#{item.title}".red
    description = item.description
    # thanks to stackoverflow.com
    # https://stackoverflow.com/questions/1442279/how-to-use-ruby-to-get-string-between-html-cite-tags
    # extract the information you would like to read.
    puts description.scan(/<p>([^<>]*)<\/p>/imu).flatten.select{|x| !x.empty?}
    puts "\n"
  end
end
