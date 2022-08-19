# frozen_string_literal: true

require "shared_stuff"

RSpec.describe Codebreaker::Statistic do
  include_context "shared stuff"
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
