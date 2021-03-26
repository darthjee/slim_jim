# frozen_string_literal: true

module Simulation
  class Infected
    def initialize(population:, mutation:)
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
