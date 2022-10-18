# frozen_string_literal: true

module LogProcessor
  class LogPresenter
    def initialize(views, type)
      @views = views
      @type = type
    end

    def call
      log_printer
    end

    private

    def log_printer
      p '=' * 18
      p "#{type.capitalize} page views"
      p '=' * 18
      views.each { |key, value| puts "#{key} => #{value}" }
    end

    attr_reader :views, :type
  end
end
