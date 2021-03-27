module Simulation
  class Result
    def initialize(results)
      @results = results
    end
  
    private

    attr_reader :results

    def to_s
      results.map(&:to_h).to_s
    end
  end
end
