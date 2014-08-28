require 'spec_helper'

module Codebreaker
  describe Game do

    # Use RSpec dynamic test double framework RSpec::Mocks
    # to create a dynamic test double. The "as_null_object"
    # pattern means to ignore any other methods and arguments
    # other than the one specified to be expected. Yet another
    # lousy design pattern name, but OK, the pattern is a good one.
    let(:output) { double('output').as_null_object }
    let(:game)   { Game.new(output) }

    describe "#start" do
      it "sends a welcome message" do        
        expect(output).to receive(:puts).with('Welcome to Codebreaker!')
        game.start('1234')
      end
      it "prompts for first guess" do
        expect(output).to receive(:puts).with('Enter guess:')
        game.start('1234')
      end
    end

    describe "#guess" do
      context "with no matches" do
        it "sends a mark with ''" do
          game.start('1234')
          expect(output).to receive(:puts).with('')
          game.guess('5678')
        end
      end
      context "with first value match" do
        it "sends a mark with '-'" do
          game.start('1234')
          expect(output).to receive(:puts).with('-')
          game.guess('5515')
        end
      end
      context "with last value match" do
        it "sends a mark with '-'" do
          game.start('1234')
          expect(output).to receive(:puts).with('-')
          game.guess('5455')
        end
      end
      context "with one value+position match" do
        it "sends a mark with '+'" do
          game.start('1234')
          expect(output).to receive(:puts).with('+')
          game.guess('1555')
        end
      end
    end
  end
end
