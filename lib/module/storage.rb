# frozen_string_literal: true

module Codebreaker
  # This is the module for load save data
  module Storage
    def load
      return unless File.file?(file_store)

      file = File.open(file_store, "r")
      data = YAML.safe_load(file, permitted_classes: [Winner])
      file.close
      @winners = data
    end

    def save
      file = File.open(file_store, "w")
      YAML.dump(@winners, file)
      file.close
    end
  end
end
