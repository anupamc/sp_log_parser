# frozen_string_literal: true

require 'csv'
require 'set'
require_relative 'log_reader'
require_relative '../validator/log_validator'

module LogProcessor
  class	LogParser < LogReader
    extend LogValidator

    def initialize(file_path)
      super(file_path)
      @visited_path = Hash.new { |h, k| h[k] = [] }
      @uniq_path = Hash.new { |h, k| h[k] = Set.new }
    end

    def call
      parse
    end

    private

    def parse
      log_reader.each_with_index do |row, index|
        LogReader.validates_log_content(row, index)
        visited_path[row[0]] << row[1]
        uniq_path[row[0]] << row[1]
      end
      [visited_path, uniq_path]
    end

    attr_reader :file_path, :visited_path, :uniq_path
  end
end
