# frozen_string_literal: true

module Simulation
  class Batch
    private_class_method :new

    def self.run(*args)
      new(*args).run
    end

    def initialize(options_hash)
      @options = BatchOptions.new(options_hash)
    end

    def run
      for_all(:infection) do |infection|
        for_all(:mutation) do |mutation|
          for_all(:activation) do |activation|
            puts simulate(infection, mutation, activation)
          end
        end
      end
    end

    private

    attr_reader :options

    delegate :for_all, to: :iterator
    delegate :population, :repetitions, to: :options

    def iterator
      @iterator ||= Iterator.new(options)
    end

    def simulate(infection, mutation, activation)
      BulkSimulation.simulate(
        infection: infection,
        mutation: mutation,
        activation: activation,
        population: population,
        repetitions: repetitions
      )
    end
  end
end
