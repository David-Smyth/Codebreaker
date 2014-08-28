require 'spec_helper'

module Codebreaker
  describe Game do
    describe "#start" do
      # Use RSpec dynamic test double framework RSpec::Mocks
      # to create a dynamic test double. The "as_null_object"
      # pattern means to ignore any other methods and arguments
      # other than the one specified to be expected. Yet another
      # lousy design pattern name, but OK, the pattern is a good one.
      let(:output) { double('output').as_null_object }
      let(:game)   { Game.new(output) }
      it "sends a welcome message" do        
        expect(output).to receive(:puts).with('Welcome to Codebreaker!')
        game.start
      end
      it "prompts for first guess" do
        expect(output).to receive(:puts).with('Enter guess:')
        game.start
      end
    end
  end
end
