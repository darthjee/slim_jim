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
        vaccinated: vaccinated
      }
    end
  
    private

    attr_reader :results

    def infected
      @infected ||= results.map(&:infected).average
    end

    def vaccinated
      @vaccinated ||= results.map(&:vaccinated).average
    end
  end
end
