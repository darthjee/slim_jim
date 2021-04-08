# frozen_string_literal: true

module Simulation
  class Iterator
    class AttributeIterator
      def initialize(key, file, options, &block)
        @key = key
        @file = file
        @options = options
        @block = block
      end

      def iterate
        if value
          block.call(value)
        else
          iterate_over_steps
        end
      end

      private

      def iterate_over_steps
        steps.times do |index|
          eps = index * delta / (steps - 1)
          block.call(min + eps)
        end

        file.write("\n")
      end

      def value
        @value ||= fetch_value
      end

      def fetch_value
        public_send(key) || (steps == 1) && min
      end

      def steps
        @steps ||= public_send("#{key}_points")
      end

      def delta
        @delta ||= max - min
      end

      def min
        public_send("min_#{key}")
      end

      def max
        public_send("max_#{key}")
      end

      attr_reader :key, :file, :options, :block

      delegate :min_population, :max_population, :population_points,
               :min_infection, :max_infection, :infection_points,
               :min_mutation,   :max_mutation,   :mutation_points,
               :min_activation, :max_activation, :activation_points,
               :population, :infection, :mutation, :activation, to: :options
    end
  end
end
