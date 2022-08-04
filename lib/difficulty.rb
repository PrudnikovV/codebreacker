# frozen_string_literal: true

module Codebreaker
  # class for Hint
  class Difficulty
    attr_reader :attempts, :hints, :name

    DEFAULT_DIFFICULTY =
      { easy: { attempts: 15, hints: 2 },
        medium: { attempts: 10, hints: 1 },
        hell: { attempts: 5, hints: 1 } }.freeze

    def initialize(name)
      @name = name.downcase
      set_count_of_steps
    end

    def set_count_of_steps
      selected = DEFAULT_DIFFICULTY[@name.to_sym]
      @attempts = selected[:attempts]
      @hints = selected[:hints]
    end
  end
end
