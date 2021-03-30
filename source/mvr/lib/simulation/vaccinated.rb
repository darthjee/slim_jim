# frozen_string_literal: true

module Simulation
  class Vaccinated
    private_class_method :new

    def self.mutated(*args)
      new(*args).mutated
    end

    def initialize(population, activation:, mutation:)
      @population = population
      @activation = activation
      @mutation = mutation
    end

    def infected
      @infected ||= calculate
    end

    def mutated
      @mutated ||= Infected.mutated(infected, mutation: mutation)
    end

    private

    attr_reader :population, :activation, :mutation

    def calculate
      count = 0
      population.times do
        count += 1 if Random.rand <= activation
      end
      count
    end
  end
end
