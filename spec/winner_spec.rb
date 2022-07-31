# frozen_string_literal: true

RSpec.describe Codebreaker::Winner do
  it "has a winner" do
    difficulty = Codebreaker::Difficulty.new("Easy", 15, 2)
    user = Codebreaker::User.new("Vlad")
    game = Codebreaker::Game.new(difficulty, user)
    winner = Codebreaker::Winner.new("Vlad", difficulty, game)
    expect(winner.name).to be "Vlad"
  end
end
