# frozen_string_literal: true

RSpec.describe Codebreaker::Statistic do
  difficulty = Codebreaker::Difficulty.new("Easy", 15, 2)
  user = Codebreaker::User.new("Vlad")
  game = Codebreaker::Game.new(difficulty, user)
  winner = Codebreaker::Winner.new("Vlad", difficulty, game)
  file_storage = "test_spec.yml"
  statistic = Codebreaker::Statistic.new(file_storage)
  statistic.winners << winner
  it "has a new winner" do
    expect(statistic.winners.size).to be 1
  end

  it "has not a winners" do
    statistic.save
    statistic.winners = []
    expect(statistic.winners.size).to be 0
  end

  it "has a one winner after load" do
    statistic.load
    expect(statistic.winners.size).to be 1
  end
  FileUtils.rm_f(file_storage)
end
