welcome = '-- Welcome to Hangman Game --'
puts welcome.rjust(40)

words = [
  'cat',
  'dog',
  'fast'
]
secret_word = words.sample # sample return random values for this array

long = secret_word.size
board = ['-'] * long 
puts 
puts board.join(' ')

  lives = 4
  while lives > 0 && board.include?('-')
    puts "You have left #{lives} intents!"
    print "Please enter a letter: "
    guess = gets.chomp 
if guess == "exit"
  puts 'Thanks for playing!'
  exit
else
    if secret_word.include?(guess)
      # If any of the letters in secret_word matxh, then 
      # update board at the location of the matching 
      # letters to reveal the guessed word.
      secret_word.chars.each_with_index do |ch, ind|
        if ch == guess 
          board[ind] = ch 
        end
      end
    else 
      lives -= 1
    # puts "Leave #{lives} intents!"
      puts 'Sorry the letter is incorrect!'
    end
      puts "\n#{board.join(' ')}"
  end
end