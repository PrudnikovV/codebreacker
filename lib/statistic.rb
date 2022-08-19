# frozen_string_literal: true

module Codebreaker
  # class for statistic of the game
  class Statistic
    include Storage
    attr_reader :file_store
    attr_accessor :winners

    def initialize(file_store)
      @file_store = file_store
      @winners = []
    end
  end
end
