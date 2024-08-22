class Mastermind
  COLORS = %w[R G B Y O P].freeze #Possible colors Red Green Blue Yellow Orange and Purple
  def initialize
    @attempts = 12
  end

  def play
    puts "Welcome to Mastermind Game"
    puts "Available colors are #{COLORS.join(', ')}"
    puts "Would you to be like as a Code Maker Press M OR Code Guesser Press G"

    role = gets.chomp.upcase

    if role == "M"
      player_as_code_maker
    elsif role == "G"
      player_as_code_guesser
    else
      puts "Invalid entry Please Press 'M' OR 'G'"
      play
    end
  end
  
  private

  # Player as the code guesser
  def player_as_code_guesser
    # Computer randomly generates the secret code
    @secret_code = Array.new(4){COLORS.sample}
    puts "Try to guess the secret code of 4 colors. you have #{@attempts} attempts." 
    @attempts.times do |attempt|
      print "\n Atempt #{attempt + 1}: Enter your guess (e.g RGBY): "
      guess = gets.chomp.upcase.chars
      
      #Validate the guess input
      if valid_guess?(guess)
        #Provide feedback for guess
        feedback = evaluate_guess(guess)
        puts "Feedback: #{feedback.join(' ')}"

        # Check if the have guess the code
        if feedback == %w[Exact Exact Exact Exact]
          puts "Congratulation ! You've guessed the code!"
          return
        end
      else
        puts "Invalid guess. Please Enter the sequence of 4 colors using letters: #{COLORS.join(', ')}"
      end
    end

    # If all attempts are used, reveal the secret code
    puts "\n You have run out the attempts! the secret code was: #{@secret_code.join}"
  end 


  # Player as the code Maker
  def player_as_code_maker
    # Player set the secret code
    print "Enter a secret code (4 colors, e.g RGBY): "
    @secret_code = gets.chomp.upcase.chars
    
    # Validate the Secret code
    unless valid_guess?(@secret_code)
      puts "Invalid secret code. Please use 4 colors from the set: #{COLORS.join(', ')}"
      return
    end

    # Computer attempts to guess the code
    puts "The computer will try to guess your secret code."
    
    @attempts.times do |attempt|
      computer_guess = Array.new(4) {COLORS.sample }
      puts "\nComputer's guess #{attempt + 1}: #{computer_guess.join}"

      feedback = evaluate_guess(computer_guess)
      puts "Feedback: #{feedback.join(' ')}"

      # Check if computer have guess the code
      if computer_guess == %w[Exact Exact Exact Exact]
        puts "The computer guessed your code. it Win!"
        return
      end
    end

    # If all attempts are used, player wins
    puts "The computer couldn't guess your code. You win!"
  end


  # Validate the guess to ensure it contain 4 valid colors
  def valid_guess?(guess)
    guess.size == 4 && guess.all? {|color| COLORS.include?(color)}
  end

  # Evaluate the guess and provide feedback
  def evaluate_guess(guess)
    feedback = []
    temp_secret_code = @secret_code.dup
    temp_guess = guess.dup
    
    # Check for exact matches (correct color and correct position)
    temp_guess.each_with_index do |color, index|
      if color == temp_secret_code[index]
        feedback << "Exact"
        temp_secret_code[index] = nil # Marks this color is matched
        temp_guess[index] = nil
      end
    end

    # Check for color matches (correct color and wrong position)
    temp_guess.each_with_index do |color, index|
      next if color.nil? # Skip already matched (exact) colors.
      if temp_secret_code.include?(color)
        feedback << "Near"

        temp_secret_code[temp_secret_code.index(color)] = nil # Mark this color as matched
      end
    end
    feedback
  end

end

