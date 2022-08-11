# frozen_string_literal: true

require "shared_stuff"

RSpec.describe Codebreaker::Game do
  include_context "shared stuff"

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
    game.attempt([1, 2, 5, 4])
    expect(game.remaining_attempts).to be 14
  end

  it "has down by one remaining_hints when add a remaining_hint" do
    game.hint
    expect(game.remaining_hints).to be 1
  end

  it "has save statistic" do
    stub_const("Codebreaker::Game::STATISTIC_FILE", "spec/entities/test_spec.yml")
    game.save_statistic
    expect(Codebreaker::Game.load_statistic.winners.size).to be 2
  end
end
