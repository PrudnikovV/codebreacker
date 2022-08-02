# frozen_string_literal: true

RSpec.describe Codebreaker::Hint do
  let(:difficulty) { Codebreaker::Difficulty.new("Easy", 15, 2) }
  let(:user) { Codebreaker::User.new("Vlad") }
  let(:game) { Codebreaker::Game.new(difficulty, user) }
  let(:hint) { Codebreaker::Hint.new(game) }
  it "has a hint from code" do
    hint = Codebreaker::Hint.new(game)
    expect(game.code.include?(hint.digit)).to be true
  end
end
