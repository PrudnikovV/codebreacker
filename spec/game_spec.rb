# frozen_string_literal: true

RSpec.describe Codebreaker::Game do
  let(:difficulty) { Codebreaker::Difficulty.new("Easy", 15, 2) }
  let(:user) { Codebreaker::User.new("Vlad") }
  let(:game) { Codebreaker::Game.new(difficulty, user) }

  it "has a hell hardness" do
    expect(game.remaining_attempts).to be 15
    expect(game.remaining_hints).to be 2
  end

  it "has a secret code size 4" do
    expect(game.code.size).to be 4
  end

  it "has every digit of secret code beetwen 1 - 6" do
    game.code.each { |digit| expect(digit).to be_between(1, 6).inclusive }
  end

  it "has down by one remaining_attempts when add a attempt" do
    attempt = Codebreaker::Attempt.new([1, 2, 5, 4], game.code)
    game.add_step(attempt)
    expect(game.remaining_attempts).to be 14
  end

  it "has down by one remaining_hints when add a remaining_hint" do
    hint = Codebreaker::Hint.new(game)
    game.add_step(hint)
    expect(game.remaining_hints).to be 1
  end
end
