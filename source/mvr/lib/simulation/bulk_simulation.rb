# frozen_string_literal: true

module Simulation
  class BulkSimulation
    private_class_method :new

    def self.simulate(*args)
      new(*args).result
    end

    def initialize(repetitions:, **attributes)
      @repetitions = repetitions
      @attributes = attributes
    end

    def result
      @result ||= Result.new(results)
    end

    private

    attr_reader :repetitions, :attributes

    def results
      repetitions.times.map do
        Simulation.simulate(attributes)
      end
    end
  end
end
