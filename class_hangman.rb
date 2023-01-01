require 'pry-byebug'

class Hangman
  attr_reader :lives 
  def initialize
    @word = words.sample
    @lives = @word.first.size 
  end

  def words 
    [
      ['cat', 'He has hair and pointy ears'],
      ['continent', 'There are 7 of these'],
      ['exotic', 'Not from around here...'],
      ['celebrate', 'Remember special moments'],
      ['jogging', 'we are not walking...']
    ]
  end

  def welcome 
    welcome = ' Welcome to the Hangman game! '
    long = welcome.length
    script = '-' * long
    puts script
    puts welcome 
    puts script 
  end

  def heading 
    puts 'If you have leave the game in any time write: exit'
    puts 'Guess the word using the clue...' 
  end

  def word 
    @word.first
  end

  def word_size 
    @word.first.size
  end

  def show_word
    puts "\n#{clue}" 
    puts "WORD: #{@show_spaces.join(' ')}"
  end

  def clue 
    "CLUE: #{@word.last}" 
  end

  def show_spaces 
    @show_spaces = ['_'] * word_size 
    show_word 
  end

  def guess!
    @guess = gets.chomp.downcase
    
    if @guess == 'exit'
      puts "\nThanks for playing..."
      exit 
    end
  end

  def quit_lives!
    if @guess.length == 1
      @lives -= 1
      puts "\nSORRY: the letter no match..."
    elsif @guess.length > 1 
      @lives -= 1
      puts "\nENTER: only one letter...."
    end
    show_word 
  end

  def match!
    if word.include? @guess 
      word.chars.each_with_index do |ch, ind|
        if ch == @guess 
          @show_spaces[ind] = ch 
        end
      end
        show_word
    else
      quit_lives!
    end
  end

  def winner
    @show_spaces.join('') == word 
  end

  def start   
    heading 
    show_spaces 
    while @lives > 0 && !winner  
      puts "\nYou have #{@lives} intents to guess!"
      print 'Enter a letter: '
      guess! 
      match!
    end
    if winner
      puts 'CONGRATULATIONS YOU WIN !!!'
    else
      puts 'SORRY you lost...'
    end
  end
end

game = Hangman.new
game.welcome
game.start 