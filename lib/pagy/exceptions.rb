# frozen_string_literal: true

class Pagy
  # Generic variable error
  class VariableError < ArgumentError
    attr_reader :pagy

    def initialize(pagy)
      super
      @pagy = pagy
    end

    def variable
      message =~ /expected :(\w+)/
      Regexp.last_match(1)&.to_sym
    end

    def value
      pagy.vars[variable]
    end
  end

  # Specific overflow error
  class OverflowError < VariableError; end
end
