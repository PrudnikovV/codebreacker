# frozen_string_literal: true

module Codebreaker
  # class for Hint
  class Hint
    attr_reader :result

    def initialize(game)
      code_dup = game.code.clone
      game.hints.each { |hint| code_dup.delete_at(code_dup.index(hint.digit)) }
      @result = code_dup.sample
    end
  end
end
