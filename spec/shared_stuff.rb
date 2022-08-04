# frozen_string_literal: true

RSpec.shared_context "shared stuff", shared_context: :metadata do
  let(:difficulty) { Codebreaker::Difficulty.new("Easy") }
  let(:user) { Codebreaker::User.new("Vlad") }
  let(:game) { Codebreaker::Game.new(difficulty, user) }
  let(:winner) { Codebreaker::Winner.new("Vlad", difficulty, game) }
end
