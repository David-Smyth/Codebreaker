module Codebreaker 
  class Game
    def initialize(output, debug = false)
      @output = output
      @debug = debug
    end
    def start(secret)
      @secret = secret.strip
      @output.puts "Welcome to Codebreaker!"
      @output.puts "Enter guess:"
    end
    def guess(guess)
      guesser = Guesser.new @output, @debug
      guesser.guess @secret, guess.strip
    end
  end

  class Guesser
    def initialize(output, debug = false)
      @output = output
      @debug = debug
    end

    def guess(secret,guess)
      return if invalid?(guess)
      @secret = secret
      @guess  = guess
      plusses = ''
      minuses = ''
      @guess.chars.each_with_index do |c,i|
        if exact_match? c, i
          plusses << '+'
          @secret[i] = 'X'
        elsif any_match? c
          minuses << '-'
          @secret.sub!(c,'Y')
        end
      end
      @output.puts "#{plusses}#{minuses}"
      @output.puts "#{@secret}" if @debug
    end

    def invalid?(guess)
      if guess =~ /\s/
        @output.puts "Guess must be 4 digits, no whitespace"
        return true
      elsif guess =~ /\D/
        @output.puts "Guess must be only 4 digits, no letters"
        return true
      elsif guess.length != 4
        @output.puts "Guess must be exactly 4 digits"
        return true
      end
      return false
    end

    def exact_match?(character, index)
      character == @secret[index]
    end

    def any_match?(character)
      @secret.include? character
    end
  end
end