# frozen_string_literal: true

RSpec.describe Codebreaker::Attempt do
  context "has correct to answer for game logic" do
    data = YAML.load_stream(File.open("./spec/entities/sample.yml", "r"))

    data.each do |arr|
      arr.each do |value|
        it "tests that #{value[0]} equals to #{value[1]}" do
          attempt = Codebreaker::Attempt.new(value[1], value[0])
          expect(attempt.result.join).to eql value.last
        end
      end
    end
  end
end
