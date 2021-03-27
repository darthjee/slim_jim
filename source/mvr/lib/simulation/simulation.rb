# frozen_string_literal: true

module Simulation
  class Simulation
    private_class_method :new

    def self.simulate(*args)
      new(*args).result
    end

    def initialize(population:, infection:, **attributes)
      @population = population
      @infection  = infection
      @attributes = attributes
    end

    def result
      @result ||= SingleResult.new(
        vaccinated: Vaccinated.mutated(population, attributes),
        infected: Infected.mutated(infected, attributes)
      )
    end

    private

    attr_reader :population, :infection,:attributes

    def infected
      (population * infection).round
    end
  end
end
