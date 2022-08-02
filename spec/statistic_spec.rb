# frozen_string_literal: true

RSpec.describe Codebreaker::Statistic do
  let(:difficulty) { Codebreaker::Difficulty.new("Easy", 15, 2) }
  let(:user) { Codebreaker::User.new("Vlad") }
  let(:game) { Codebreaker::Game.new(difficulty, user) }
  let(:winner) { Codebreaker::Winner.new("Vlad", difficulty, game) }
  let(:statistic) { Codebreaker::Statistic.new("spec/entities/test_spec.yml") }

  it "has a new winner" do
    statistic.winners << winner
    expect(statistic.winners.size).to be 1
  end

  it "has not a winners" do
    statistic.winners << winner
    statistic.save
    statistic.winners = []
    expect(statistic.winners.size).to be 0
  end

  it "has a one winner after load" do
    statistic.load
    expect(statistic.winners.size).to be 1
  end
end
