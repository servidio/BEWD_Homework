# mashable.rb

require 'json'
require 'rest-client'

# posts = JSON.load(RestClient.get 'https://api.mashable.com/v1/posts')

# # puts topics_hash.keys

# # puts topics_hash["posts"].first["title"]

# date = Time.new

# puts "Top Posts from Mashable for #{date}:"

# posts["posts"].each do |hash|
# 	puts hash["title"]
# 	puts hash["title"]["content"]

# 	puts " "
# end

# gets

reddit = JSON.load(RestClient.get 'https://api.reddit.com')

top_reddit = reddit["data"]["children"]

# puts "Trending Posts from Reddit for #{date}:"

# top_reddit.each do |post|
# 	puts post["data"]["title"]
# 	puts post["data"]["url"]
# 	puts post["data"]["score"]
# 	puts " "
# end

reddit_array = Array.new
num = 0

top_reddit.map do |post|
	num += 1
	reddit_array[num] = Hash.new(
	{})

	["Title"] = post["data"]["title"]
	reddit_array["Site"] = post["data"]["url"]
	reddit_array["Score"] = post["data"]["score"]
end
# puts reddit["data"]["children"].first["data"]["title"]
# puts reddit["data"]["children"].first["data"]["url"]