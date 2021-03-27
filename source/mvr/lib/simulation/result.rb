# frozen_string_literal: true

module Simulation
  class Result
    def initialize(results)
      @results = results
    end

    def to_s
      to_h.to_s
    end

    def to_h
      {
        infected: infected,
        infected_deviance: infected_deviance,
        vaccinated: vaccinated,
        vaccinated_deviance: vaccinated_deviance
      }
    end

    private

    attr_reader :results
    delegate :size, to: :results

    def infected
      @infected ||= infected_collection.average
    end

    def vaccinated
      @vaccinated ||= vaccinated_collection.average
    end

    def infected_deviance
      infected_collection.deviance
    end

    def vaccinated_deviance
      vaccinated_collection.deviance
    end

    def infected_collection
      @infected_collection ||= Collection.new(results.map(&:infected))
    end

    def vaccinated_collection
      @vaccinated_collection ||= Collection.new(results.map(&:vaccinated))
    end
  end
end
