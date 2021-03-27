# frozen_string_literal: true

module Simulation
  class Infected
    private_class_method :new

    def self.mutated(*args)
      new(*args).mutated
    end

    def initialize(population:, mutation:, **_args)
      @population = population
      @mutation = mutation
    end

    def mutated
      @mutated ||= calculate
    end

    private

    attr_reader :population, :mutation

    def calculate
      count = 0
      population.times do
        count += 1 if Random.rand <= mutation
      end
      count
    end
  end
end
