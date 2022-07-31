# frozen_string_literal: true

module Codebreaker
  # class for winner of the game
  class Validation
    def name_valid?(name)
      name.is_a?(String) && name.size.between?(3, 20)
    end

    def number_valid?(number)
      number.size == 4 && number.map do |dig|
        dig.is_a?(Integer) &&
          dig.between?(1, 6)
      end.reduce(:&)
    end
  end
end

