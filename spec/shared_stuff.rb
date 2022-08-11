# frozen_string_literal: true

RSpec.shared_context "shared stuff", shared_context: :metadata do
  let(:difficulty) { Codebreaker::Difficulty.new("Easy") }
  let(:game) { Codebreaker::Game.new() }
  let(:winner) { Codebreaker::Winner.new("Vlad", game) }
  before (:each) do
     game.user("Vlad")
     game.set_difficulty("Easy")
  end
end
