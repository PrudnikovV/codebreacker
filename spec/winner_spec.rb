# frozen_string_literal: true

RSpec.describe Codebreaker::Winner do
  let(:difficulty) { Codebreaker::Difficulty.new("Easy", 15, 2) }
  let(:user) { Codebreaker::User.new("Vlad") }
  let(:game) { Codebreaker::Game.new(difficulty, user) }
  let(:winner) { Codebreaker::Winner.new("Vlad", difficulty, game) }
  it "has a winner" do
    expect(winner.name).to be "Vlad"
  end
end
