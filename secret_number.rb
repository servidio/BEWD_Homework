# secret_number.rb

# Welcomes user to game and asks for player name
puts "Hi there and welcome to the secret number game!"
puts "Created by MOI: Chris Servidio"
print "What is your player name: "

# Gets string input from user and chomps off the \n
player_name = gets.chomp


# Outlines the rules for the game
puts "
*******************************************************"
puts "Thanks #{player_name}. Excited to have you join the game."
puts "See below for the rules: "
puts "1. You will be guessing a secret number from 1 to 10"
puts "2. You will have 3 guesses to get the correct number"
puts "3. If you guess correctly, you win! 
	Otherwise, you're terrible."
puts "*******************************************************"
puts "
		"
puts "Let's get started!!"

# Chooses a random number from the array of 1 to 10
secret_number = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10].sample

# Sets counter variable for number of tries to 3 to start
tries = 3

# Sets try count and user guess to 0
count = guess = 0

# Initiates loop that will continue until either user guesses secret number
# or user reaches 3 guesses; count increases through each iteration of loop
while count < 3 && guess != secret_number
	count += 1
	print "Guess # #{count}: "

	# Takes user's guess from keyboard input and converts it to an integer
	guess = gets.to_i

	# Compares user's guess to computer-generated random integer
	# Gives hint whether their next guess should be higher or lower
	# Tells user they have 1 or 2 tries less as long as the loop count is less than 3
	if guess != secret_number && count < 3
		tries -= 1
		if guess < secret_number
			puts "Try a higher number."
		else 
			puts "Try a lower number."
		end
		puts "You have #{tries} guess(es) left.
		"

	# If user reaches 3 loop counts and doesn't guess the number,
	# lets them know that the user has lost and exits the game
	elsif guess != secret_number && count == 3
		puts "I'm sorry my friend. You lose!"
		puts "The secret number was #{secret_number}."
	
	# If user guesses correctly, it notifies them that they won
	# and exits the loop
	else
		puts "Lucky guess! You are correct."
	end
end		