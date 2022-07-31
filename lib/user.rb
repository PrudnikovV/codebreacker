# frozen_string_literal: true

module Codebreaker
  # class for winner of the game
  class User
    attr_accessor :name

    def initialize(name)
      @name = name
    end
  end
end
