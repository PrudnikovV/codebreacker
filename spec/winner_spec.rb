# frozen_string_literal: true

require "shared_stuff"
RSpec.describe Codebreaker::Winner do
  include_context "shared stuff"
  it "has a winner" do
    expect(winner.name).to be "Vlad"
  end
end
