# frozen_string_literal: true

require "shared_stuff"
RSpec.describe Codebreaker::Hint do
  include_context "shared stuff"

  let(:hint) { Codebreaker::Hint.new(game) }
  it "has a hint from code" do
    hint = Codebreaker::Hint.new(game)
    expect(game.code.include?(hint.digit)).to be true
  end
end
