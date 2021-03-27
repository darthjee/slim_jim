# frozen_string_literal: true

module Simulation
  class SingleResult
    def initialize(vaccinated:, infected:)
      @vaccinated = vaccinated
      @infected   = infected
    end

    def ratio
      @ratio ||= vaccinated.to_f / infected
    end

    attr_reader :vaccinated, :infected

    def to_h
      {
        vaccinated: vaccinated,
        infected: infected,
        ratio: ratio
      }
    end
  end
end
