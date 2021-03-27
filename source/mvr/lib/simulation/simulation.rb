# frozen_string_literal: true

module Simulation
  class Simulation
    private_class_method :new

    def self.simulate(*args)
      new(*args).result
    end

    def initialize(attributes)
      @attributes = attributes
    end

    def result
      @result ||= SingleResult.new(
        vaccinated: Vaccinated.mutated(attributes),
        infected: Infected.mutated(attributes)
      )
    end

    private

    attr_reader :attributes
  end
end
