# frozen_string_literal: true

module Codebreaker
  # class for Hint
  class Difficulty
    attr_reader :attempts, :hints, :name

    def initialize(name, attempts, hints)
      @name = name
      @attempts = attempts
      @hints = hints
    end
  end
end
