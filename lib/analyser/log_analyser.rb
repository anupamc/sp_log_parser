# frozen_string_literal: true

module LogProcessor
  class	LogAnalyser
    def call(parsed_file)
      views_counter(parsed_file)
    end

    private

    def views_counter(data)
      formatted_hash = count_size(data)
      sort_hash(formatted_hash)
    end

    def sort_hash(formatted_hash)
      formatted_hash.sort_by { |_k, v| -v }.to_h
    end

    def count_size(parsed_log)
      parsed_log.each { |k, v| parsed_log[k] = v.size }
    end
  end
end
