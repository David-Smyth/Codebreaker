module Codebreaker 
  class Game
    def initialize(output, debug = false)
      @output = output
      @debug = debug
    end
    def start(secret)
      @secret = secret
      @output.puts "Welcome to Codebreaker!"
      @output.puts "Enter guess:"
    end
    def guess(guess)
      guess.strip!
      return if invalid?(guess)
      secret = @secret.dup
      plusses = ''
      minuses = ''
      guess.chars.each_with_index do |c,i|
        if exact_match? c, i, secret
          plusses << '+'
          secret[i] = 'X'
        elsif any_match? c, secret
          minuses << '-'
          secret.sub!(c,'Y')
        end
      end
      @output.puts "#{plusses}#{minuses}"
      @output.puts "#{secret}" if @debug
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

    def exact_match?(character, index, secret)
      character == secret[index]
    end
    def any_match?(character, secret)
      secret.include? character
    end
  end
end