# frozen_string_literal: true

RSpec.describe Codebreaker::Validation do
  let(:validation) { Codebreaker::Validation.new }
  it "has a name longer then 3 and less than 20" do
    expect(validation.name_valid?("vl")).to be false
    expect(validation.name_valid?("vladimir")).to be true
    expect(validation.name_valid?("vladimirvladimirvladimirvladimir")).to be false
  end

  it "has a number 4 longer and every digit in range 1 - 6" do
    expect(validation.number_valid?([1, 2, 7, 8])).to be false
    expect(validation.number_valid?([1, 2, 3, 5, 2])).to be false
    expect(validation.number_valid?([1, 2, 3])).to be false
    expect(validation.number_valid?([1, 2, 4, 2])).to be true
  end
end
