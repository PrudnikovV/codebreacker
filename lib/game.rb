# frozen_string_literal: true

module Codebreaker
  # class for Game
  class Game
    attr_reader :attempts, :hints, :remaining_attempts, :remaining_hints, :code, :difficulty, :user

    DIGITS_RANGE = (1..6).freeze
    QUANTITY_DIGITS = 4
    STATISTIC_FILE = "data/winners.yml"

    def initialize()
      @code = new_secret_code
      @attempts = []
      @hints = []
    end

    def next_step
      return :win if win?
      return :loose if loose?
      return :attempt if @remaining_hints == 0
      [:attempt, :hint]
    end

    def set_difficulty(choice)
      @difficulty = Codebreaker::Difficulty.new(choice)
      @remaining_attempts = @difficulty.attempts
      @remaining_hints = @difficulty.hints
    end

    def get_standart_difficulties
      Codebreaker::Difficulty::STANDART_DIFFICULTIES.keys.join(", ")
    end

    def user(name)
      @user = Codebreaker::User.new(name)
    end

    def win?
      @attempts.size.positive? && @attempts.last.attempt_code == @code
    end

    def loose?
      @remaining_attempts.zero?
    end

    def validate?(data)
      case data
      when String then Codebreaker::Validation.new.name_valid?(data)
      else Codebreaker::Validation.new.number_valid?(data)
      end
    end

    def self.load_statistic
      statistic = Codebreaker::Statistic.new(STATISTIC_FILE)
      statistic.load
      statistic
    end

    def save_statistic
      winner = Codebreaker::Winner.new(@user.name, self)
      statistic = Codebreaker::Game::load_statistic
      statistic.winners << winner
      statistic.save
    end

    def attempt(user_code)
      attempt = Codebreaker::Attempt.new(user_code, @code)
      @attempts << attempt
      @remaining_attempts -= 1
      attempt.result
    end

    def hint
      hint = Codebreaker::Hint.new(self)
      @hints << hint
      @remaining_hints -= 1
      hint.result
    end

    def new_secret_code
      Array.new(QUANTITY_DIGITS) { rand(DIGITS_RANGE) }
    end
  end
end
