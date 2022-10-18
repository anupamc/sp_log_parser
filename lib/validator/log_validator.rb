# frozen_string_literal: true

module LogProcessor
  module LogValidator
    def validates_file_presence(file_path)
      raise "Couldn't find file in the given path: #{file_path}" unless File.exist?(file_path)
    end

    def validates_log_content(row, index)
      raise "Missing log content at line: #{index + 1}" if row[0].nil? || row[1].nil?
    end
  end
end
