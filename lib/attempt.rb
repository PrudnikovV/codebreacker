# frozen_string_literal: true

module Codebreaker
  # class for attempt
  class Attempt
    attr_reader :result, :attempt_code, :secret_code

    def initialize(attempt_code, secret_code)
      @attempt_code = attempt_code
      @secret_code = secret_code
      colculation
    end

    def colculation
      @result = @attempt_code.select.with_index { |e, i| e == @secret_code[i] }.map { "+" }
      @result += ["-"] * (@attempt_code.uniq.map { |e| min_quentyty(e) }.sum - result.count)
    end

    private

    def min_quentyty(elm)
      [@attempt_code.count(elm), @secret_code.count(elm)].min
    end
  end
end
