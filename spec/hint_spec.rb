# frozen_string_literal: true

RSpec.describe Codebreaker::Hint do
  it "has a hint from code" do
    difficulty = Codebreaker::Difficulty.new("Easy", 15, 2)
    user = Codebreaker::User.new("Vlad")
    game = Codebreaker::Game.new(difficulty, user)
    hint = Codebreaker::Hint.new(game)
    expect(game.code.include?(hint.digit)).to be true
  end
end
