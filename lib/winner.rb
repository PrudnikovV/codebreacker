# frozen_string_literal: true

module Codebreaker
  # class for winner of the game
  class Winner
    attr_reader :name, :difficulty, :attempts_used, :hints_used, :attempts, :hints

    def initialize(name, game)
      @name = name
      @difficulty = game.difficulty.name
      @attempts = game.difficulty.attempts
      @hints = game.difficulty.hints
      @attempts_used = game.attempts.size
      @hints_used = game.hints.size
    end
  end
end
