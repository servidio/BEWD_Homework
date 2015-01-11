# reddit.rb

# requiring both json and rest-client in order to more easily access the
# reddit API
require 'json'
require 'rest-client'

# sets the post count to 0 (for an easier view) and brings in the current
# date and time to head the list of top reddit posts
count = 0
date = Time.new

# uses JSON via a RestClient GET command to load the top post reddit API 
# into a hash usable by ruby
top_posts = JSON.load(RestClient.get 'https://api.reddit.com/top/')

# creates an array for iteration out of the keys "data" and "children"
reddit_array = top_posts["data"]["children"]

puts "Here are the top 25 Reddit posts on #{date}: "
puts " "

# iterates through each post on page one of the top 25 displaying
# the post title, post URL so user can easily navigate as well as
# the number of up votes that each post has received over its lifespan

reddit_array.each do |post|
	count += 1
	puts "#{count}." + post["data"]["title"]
	puts "	" + post["data"]["url"]
	puts "	Number of up votes: #{post["data"]["score"]}"
	puts " "
end


# the second portion of this program asks for input from the user regarding
# which of the reddit posts from above they'd like to open in their browser
puts "Which post would you like to open in your browser?"
print "Please enter a number 1 to 25 or any other number to exit: "

choice = gets.to_i

# as long as their choice is one of the 25 options, it will execute the below
# block of code
if choice > 0 && choice <= 25

	# subtract one from the user inputted choice in order to locate the correct
	# index within the reddit post array
	choice -= 1

	# calls on the system to open the selected URL in the system's default browser
	puts "Opening URL. One moment please."
	system("open", "#{reddit_array[choice]["data"]["url"]}")
else
	# if user puts in any other character outside of 1-25, program exits
	puts "Goodbye!"
end