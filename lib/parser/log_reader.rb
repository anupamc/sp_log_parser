# frozen_string_literal: true

require 'csv'
require_relative '../validator/log_validator'

module LogProcessor
  class	LogReader
    extend LogValidator

    def initialize(file_path)
      @file_path = file_path
    end

    private

    def log_reader
      LogReader.validates_file_presence(file_path)
      CSV.foreach(file_path, col_sep: ' ')
    end

    attr_reader :file_path
  end
end
