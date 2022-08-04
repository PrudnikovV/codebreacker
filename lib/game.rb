# frozen_string_literal: true

module Codebreaker
  # class for Game
  class Game
    attr_reader :attempts, :hints, :remaining_attempts, :remaining_hints, :code

    DIGITS_RANGE = (1..6).freeze
    QUANTITY_DIGITS = 4

    def initialize(difficulty, user)
      @remaining_attempts = difficulty.attempts
      @remaining_hints = difficulty.hints
      @code = new_secret_code
      @attempts = []
      @hints = []
      @user = user
    end

    def add_step(step)
      case step
      when Codebreaker::Hint then hint(step)
      when Codebreaker::Attempt then attempt(step)
      end
    end

    def win?
      @attempts.size.positive? && @attempts.last.attempt_code == @code
    end

    def loose?
      @remaining_attempts.zero?
    end

    private

    def attempt(attempt)
      @attempts << attempt
      @remaining_attempts -= 1
    end

    def hint(hint)
      @hints << hint
      @remaining_hints -= 1
    end

    def new_secret_code
      Array.new(QUANTITY_DIGITS) { rand(DIGITS_RANGE) }
    end
  end
end
