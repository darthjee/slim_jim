# frozen_string_literal: true

module Simulation
  class Result
    include SafeAttributeAssignment

    attr_accessor :infection, :mutation, :activation, :population, :repetitions

    def initialize(results, **attributes)
      @results = results
      @attributes = attributes
      assign_attributes(attributes)
    end

    def to_s
      to_h.to_s
    end

    def to_h
      attributes.merge(
        infected: infected,
        infected_deviance: infected_deviance,
        vaccinated: vaccinated,
        vaccinated_deviance: vaccinated_deviance,
        ratio: ratio,
        ratio_deviance: ratio_deviance,
        log_ratio: log_ratio,
        log_ratio_deviance: log_ratio_deviance
      )
    end

    def infected
      @infected ||= infected_collection.average
    end

    def vaccinated
      @vaccinated ||= vaccinated_collection.average
    end

    def ratio
      @ratio ||= ratio_collection.average
    end

    def log_ratio
      @log_ratio ||= log_ratio_collection.average
    end

    def infected_deviance
      infected_collection.deviance
    end

    def vaccinated_deviance
      vaccinated_collection.deviance
    end

    def ratio_deviance
      ratio_collection.deviance
    end

    def log_ratio_deviance
      log_ratio_collection.deviance
    end

    private

    attr_reader :results, :attributes
    delegate :size, to: :results

    def infected_collection
      @infected_collection ||= Collection.new(results.map(&:infected))
    end

    def vaccinated_collection
      @vaccinated_collection ||= Collection.new(results.map(&:vaccinated))
    end

    def ratio_collection
      @ratio_collection ||= Collection.new(results.map(&:ratio))
    end

    def log_ratio_collection
      @log_ratio_collection ||= Collection.new(results.map(&:ratio))
    end
  end
end
