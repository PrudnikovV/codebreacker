# frozen_string_literal: true

RSpec.describe Codebreaker::User do
  it "has a user" do
    user = Codebreaker::User.new("Vlad")
    expect(user.name).to be "Vlad"
  end
end
