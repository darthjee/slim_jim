# frozen_string_literal: true

module Simulation
  class Iterator
    autoload :AttributeIterator, 'simulation/iterator/attribute_iterator'

    def initialize(options)
      @options = options
    end

    def for_all(key, &block)
      AttributeIterator.new(key, options, &block).iterate
    end

    private

    attr_reader :options
  end
end
