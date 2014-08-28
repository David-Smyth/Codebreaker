module Codebreaker 
  class Game
    def initialize(output)
      @output = output
    end
    def start(secret)
      @secret = secret
      @output.puts "Welcome to Codebreaker!"
      @output.puts "Enter guess:"
    end
    def guess(guess)
      plusses = ""
      minuses = ""
      guess.chars.to_a.each_with_index do |c,i|
        if exact_match? c, i
          plusses << "+"
        elsif any_match? c
          minuses << "-"
        end
      end
      @output.puts "#{plusses}#{minuses}"
    end
    def exact_match?(character, index)
      character == @secret[index]
    end
    def any_match?(character)
      @secret.include? character
    end
  end
end