# frozen_string_literal: true

module Codebreaker
  # class for attempt
  class Attempt
    attr_reader :result, :attempt_code, :secret_code

    SAME_POSITION = "+"
    OTHER_POSITION = "-"

    def initialize(attempt_code, secret_code)
      @attempt_code = attempt_code
      @secret_code = secret_code
      calculation
    end

    def calculation
      @result = @attempt_code.select.with_index { |e, i| e == @secret_code[i] }.map { SAME_POSITION }
      @result += [OTHER_POSITION] * (@attempt_code.uniq.map { |e| min_quantity(e) }.sum - result.count)
    end

    private

    def min_quantity(elm)
      [@attempt_code.count(elm), @secret_code.count(elm)].min
    end
  end
end
