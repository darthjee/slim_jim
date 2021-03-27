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
      @infected ||= infected_list.average
    end

    def vaccinated
      @vaccinated ||= vaccinated_collection.average
    end

    def vaccinated_deviance
      vaccinated_collection.deviance
    end

    def vaccinated_collection
      @vaccinated_collection ||= Collection.new(results.map(&:vaccinated))
    end

    def infected_deviance
      @infected_deviance ||= Math.sqrt(infected_deviances.sum / size)
    end

    def infected_deviances
      infected_list.map do |value|
        (value - infected) ** 2
      end
    end

    def infected_list
      @infected_list ||= results.map(&:infected)
    end
  end
end
