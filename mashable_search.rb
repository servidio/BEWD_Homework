# mashable_search.rb

# requiring both json and rest-client in order to more easily access the
# mashable API
require 'json'
require 'rest-client'

# this method displays top Mashable posts within a user-given category
# this particular method is passed a URL that will access the Mashable API
def load_topics(address)

	# uses JSON via a RestClient GET command to load the top post Mashable API 
	# into an array usable by ruby; sets article count to 1 for first article
	posts = JSON.load(RestClient.get address)
	num = 1

	# iterates through each post within the ["hot"] key displaying the post's
	# title and url for quick access for the user
	posts["hot"].each do |array|
		puts "#{num}" + array["title"]
		puts "		" + array["short_url"]
		puts " "
		num += 1
	end

	# once method has outputted the top 10 articles within a given category
	# it then asks for user input regarding which article they'd like to read
	puts "Which topic would you like to read?"
	print "Please enter a number from 1 to 10 or any other # to exit. "

	article = gets.to_i

	# as long as the article choice is between 1 and 10, the below conditional
	# will clear the previous screen, display the title of chosen article as 
	# well as the content in plain text; once user is done reading they are
	# prompted to press enter to return to menu of categories for furthe reading 
	if article > 0 && article <= 10
		article -= 1
		system "clear"
		puts posts["hot"][article]["title"]
		puts " "
		puts posts["hot"][article]["content"]["plain"]
		puts " "
		puts "Press enter when done reading."

		gets
		system "clear"
	else
		puts "I'm sorry, you didn't enter a correct article #."
		puts " "
	end
end

# this method outputs all 6 topic choices from Mashable.com and requests
# user input regarding which category they're interested in reading
def list_topics
	puts "1. Social Media"
	puts "2. Tech"
	puts "3. Business"
	puts "4. Entertainment"
	puts "5. World"
	puts "6. Watercooler"
	puts " "
	puts "Which topic interests you most?"
	print "Please enter a number 1 through 6 or press any other # to quit: "
end

# this is the main block of code for this program welcoming user to Mashable
# and calling on list_topics method to get the process started
puts "Welcome to Mashable.com. See below for channels:"
list_topics

# this variable gets the user choice from the keyboard and convers from 
# string to integer
choice = gets.to_i

# this loop will continue as long as user continues to enter a choice from
# the list of six displayed on Mashable.com
while choice > 0 && choice <= 6
	# this variable draws in a new date/time to display to user for most 
	# up-to-date results
	date = Time.new

	# the following conditionals will be executed as long as the user enters 
	# a valid category choice; if valid, the correct URL for each category will
	# be passed to the load_topics method and the mashable API accessed
	if choice == 1
		system "clear"
		url = 'http://mashable.com/social-media.json'
		puts " "
		puts "Here are the top 10 stories in SOCIAL MEDIA on #{date}:"
		load_topics(url)
	elsif choice == 2
		system "clear"
		url = 'http://mashable.com/tech.json'
		puts " "
		puts "Here are the top 10 stories in TECH on #{date}:"
		load_topics(url)
	elsif choice == 3
		system "clear"
		url = 'http://mashable.com/business.json'
		puts " "
		puts "Here are the top 10 stories in BUSINESS on #{date}:"
		load_topics(url)
	elsif choice == 4
		system "clear"
		url = 'http://mashable.com/entertainment.json'
		puts " "
		puts "Here are the top 10 stories in ENTERTAINMENT on #{date}:"
		load_topics(url)
	elsif choice == 5
		system "clear"
		url = 'http://mashable.com/world.json'
		puts " "
		puts "Here are the top 10 stories in WORLD on #{date}:"
		load_topics(url)
	elsif choice == 6
		system "clear"
		url = 'http://mashable.com/watercooler.json'
		puts " "
		puts "Here are the top 10 stories in WATERCOOLER on #{date}:"
		load_topics(url)
	else
		# if user enters an invalid choice, program will exit
		puts "Thanks for checking out Mashable.com!"
	end

	# program will continue requesting input from user until they choose to exit
	list_topics
	choice = gets.to_i
end