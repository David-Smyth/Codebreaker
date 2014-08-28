class FakeOutput
  def messages
    @messages ||= []
  end
  def puts(message)
    messages << message
  end
end
def fout
  @fake_output ||= FakeOutput.new
end

Given(/^I am not yet playing$/) do
end

When(/^I start a new game$/) do
  game = Codebreaker::Game.new(fout)
  game.start('1234')
end

Then(/^I should see "(.*?)"$/) do |message|
  expect(fout.messages).to include(message)
end

Given(/^the secret code is "(.*?)"$/) do |secret|
  @game = Codebreaker::Game.new(fout)
  @game.start(secret)
end

When(/^I guess "(.*?)"$/) do |guess|
  @game.guess(guess)
end

Then(/^the mark should be "(.*?)"$/) do |mark|
  expect(fout.messages).to include(mark)
end

When(/^I provide an invalid "(.*?)"$/) do |guess|
  @game = Codebreaker::Game.new(fout)
  @game.start('1234')
  @game.guess(guess)
end

Then(/^the response should be "(.*?)"Guess must be exactly (\d+) digits"(.*?)"$/) do |_, _, _|
  expect(fout.messages).to include("Guess must be exactly 4 digits")
end

Then(/^the response should be "(.*?)"Guess must be only (\d+) digits, no letters"(.*?)"$/) do |_, _, _|
  expect(fout.messages).to include("Guess must be only 4 digits, no letters")
end

Then(/^the response should be "(.*?)"Guess must be (\d+) digits, no whitespace"(.*?)"$/) do |_, _, _|
  expect(fout.messages).to include("Guess must be 4 digits, no whitespace")
end

