require 'spec_helper'

module Codebreaker
  describe Game do
    describe "#start" do
      it "sends a welcome message" do
        # Use RSpec dynamic test double framework RSpec::Mocks
        # to create a dynamic test double. The "as_null_object"
        # pattern means to ignore any other methods and arguments
        # other than the one specified to be expected. Yet another
        # lousy design pattern name, but OK, the pattern is a good one.
        output = double('output').as_null_object
        game = Game.new(output)
        expect(output).to receive(:puts).with('Welcome to Codebreaker!')
        game.start
      end
      it "prompts for first guess" do
        output = double('output').as_null_object
        game = Game.new(output)
        expect(output).to receive(:puts).with('Enter guess:')
        game.start
      end
    end
  end
end
