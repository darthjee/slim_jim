# frozen_string_literal: true

module Simulation
  class Iterator
    autoload :AttributeIterator, 'simulation/iterator/attribute_iterator'

    def initialize(options, file)
      @options = options
      @file = file
    end

    def for_all(key, &block)
      AttributeIterator.new(key, file, options, &block).iterate
    end

    private

    attr_reader :file, :options
  end
end
