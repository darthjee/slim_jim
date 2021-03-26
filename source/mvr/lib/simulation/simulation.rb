module Simulation
  class Simulation

    private_class_method :new

    def self.simulate(*args)
      new(*args).simulate
    end

    def initialize(attributes)
      @attributes ||= attributes
    end

    def simulate
      SingleResult.new(
        vaccinated: Vaccinated.mutated(attributes),
        infected:   Infected.mutated(attributes)
      )
    end

    private

    attr_reader :attributes
  end
end
