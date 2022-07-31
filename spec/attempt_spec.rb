# frozen_string_literal: true

RSpec.describe Codebreaker::Attempt do
  it "has correct to answer for game logic" do
    attempt = Codebreaker::Attempt.new([5, 6, 4, 3], [6, 5, 4, 3])
    expect(attempt.result).to eq(["+", "+", "-", "-"])

    attempt = Codebreaker::Attempt.new([6, 4, 1, 1], [6, 5, 4, 3])
    expect(attempt.result).to eq(["+", "-"])

    attempt = Codebreaker::Attempt.new([6, 5, 4, 4], [6, 5, 4, 3])
    expect(attempt.result).to eq(["+", "+", "+"])

    attempt = Codebreaker::Attempt.new([3, 4, 5, 6], [6, 5, 4, 3])
    expect(attempt.result).to eq(["-", "-", "-", "-"])

    attempt = Codebreaker::Attempt.new([6, 6, 6, 6], [6, 5, 4, 3])
    expect(attempt.result).to eq(["+"])

    attempt = Codebreaker::Attempt.new([2, 6, 6, 6], [6, 5, 4, 3])
    expect(attempt.result).to eq(["-"])

    attempt = Codebreaker::Attempt.new([2, 2, 2, 2], [6, 5, 4, 3])
    expect(attempt.result).to eq([])
  end
end
