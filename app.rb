# frozen_string_literal: true

require 'require_all'
require_all 'lib'

parsed_log = LogProcessor::LogParser.new(ARGV[0]).call

visited_path = LogProcessor::LogAnalyser.new.call(parsed_log.first)
LogProcessor::LogPresenter.new(visited_path, 'total').call

uniq_path = LogProcessor::LogAnalyser.new.call(parsed_log.last)
LogProcessor::LogPresenter.new(uniq_path, 'unique').call
