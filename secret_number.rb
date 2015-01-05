# secret_number.rb

puts "Hi there and welcome to the secret number game!"
puts "Created by MOI: Chris Servidio"
print "What is your player name: "

player_name = gets.chomp

puts "
***********************************************"
puts "Thanks #{player_name}. Excited to have you join the game."
puts "See below for the rules: "
puts "1. You will be guessing a secret number from 1 to 10"
puts "2. You will have 3 guesses to get the correct number"
puts "3. If you guess correctly, you win! 
	Otherwise, you're terrible."
puts "***********************************************"
puts "
		"
puts "Let's get started!!"

secret_number = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10].sample
tries = 3
count = guess = 0

while count < 3 && guess != secret_number
	count += 1
	print "Guess # #{count}: "
	guess = gets.to_i

	if guess != secret_number && count < 3
		tries -= 1
		if guess < secret_number
			puts "Try a higher number."
		else 
			puts "Try a lower number."
		end
		puts "You have #{tries} guess(es) left.
		"
	elsif guess != secret_number && count == 3
		puts "I'm sorry my friend. You lose!"
		puts "The secret number was #{secret_number}."
	else
		puts "Lucky guess! You are correct."
	end
end		