# frozen_string_literal: true

require "shared_stuff"
RSpec.describe Codebreaker::Hint do
  include_context "shared stuff"

  let(:hint) { Codebreaker::Hint.new(game) }
  it "has a hint from code" do
    expect(game.code.include?(hint.result)).to be true
  end
end
