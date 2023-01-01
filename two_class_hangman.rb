class Hangman 
  attr_reader :lives, :board, :secret_word
  def initialize 
    @lives = 7
    @secret_word = word_list.sample 
    @board = setup_board
  end

  def word_list 
    [
      'cat',
      'dog',
      'fast',
      'sky'
    ]
  end

  # def secret_word
  #   @secret_word
  # end

  def setup_board
    ['_'] * secret_word.size 
  end

  def start
    puts 'Welcome to Hangman'

    # while the player has lives and has not won  
    while lives > 0 && !won?
      # print the number of lives 
      puts "\nYou have #{@lives} left..."
      # print the board state 
      puts board_state 
      # receive a guess 
      guess = make_guess!
      # update the board 
      update_board(guess)
    end 

    if won? 
      puts board_state
      puts 'You won!...'
    else 
      puts 'You lost!...'
    end
  end

  def make_guess!
    print "\nPlease guess a letter: "
    gets.chomp 
  end

  def board_state 
    board.join(' ')
  end

  def update_board(guess)
    if secret_word.include?(guess)
      i = 0
      while i < secret_word.size 
        if guess.downcase == secret_word[i].downcase
          board[i] = secret_word[i]
        end
        i += 1
      end
    else
      @lives -= 1
      puts 'Sorry the letter no match!'
    end
  end

  def won?
    board.join('') == secret_word
  end
end

game = Hangman.new
game.start 