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
      repetitions.times.map do
        Simulation.simulate(attributes)
      end
    end

    private

    attr_reader :repetitions, :attributes
  end
end

