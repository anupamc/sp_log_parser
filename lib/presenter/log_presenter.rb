# frozen_string_literal: true

require 'terminal-table'

module LogProcessor
  class LogPresenter
    def initialize(views, type)
      @views = views
      @type = type
    end

    def call
      puts form_table
    end

    private

    def form_table
      Terminal::Table.new(
        rows: views,
        headings: ['Path', "#{count_type.capitalize} Views"],
        title: "#{count_type} page views"
      )
    end

    def count_type
      case type
      when :total
        'total'
      when :unique
        'unique'
      end
    end

    attr_reader :views, :type
  end
end
