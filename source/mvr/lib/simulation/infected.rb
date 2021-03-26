module Simulation
  class Infected
    def initialize(population, probability)
      @population = population
      @probability = probability
    end

    def mutated
      @mutated ||= calculate
    end

    private

    attr_reader :population, :probability

    def calculate
      count = 0
      population.times do
        count += 1 if Random.rand <= probability
      end
      count
    end
  end
end
