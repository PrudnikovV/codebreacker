# frozen_string_literal: true

module Codebreaker
  # class for winner of the game
  class Winner
    attr_reader :name, :difficulty, :attempts_used, :hints_used, :attempts, :hints

    def initialize(name, difficulty, game)
      @name = name
      @difficulty = difficulty.name
      @attempts = difficulty.attempts
      @hints = difficulty.hints
      @attempts_used = game.attempts.size
      @hints_used = game.hints.size
    end
  end
end
