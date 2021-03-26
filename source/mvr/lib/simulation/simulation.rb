module Simulation
  class Simulation

    private_class_method :new

    def self.simulate(*args)
      new(*args).simulate
    end

    def initialize(population, infection, mutation)
      @population = population
      @infection  = infection
      @mutation   = mutation
    end

    def simulate
      {
        vaccinated: Vaccinated.new(population, infection, mutation).mutated
      }
    end

    private

    attr_reader :population, :infection, :mutation
  end
end
