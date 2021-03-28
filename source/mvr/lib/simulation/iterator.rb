module Simulation
  class Iterator
    def initialize(options)
      @options = options
    end

    def for_all(key, &block)
      if (public_send(key))
        yield(public_send(key))
      else
        iterate_over(key, &block)
      end
    end

    def iterate_over(key)
      steps = public_send("#{key}_points")
      min = public_send("min_#{key}")
      max = public_send("max_#{key}")
      delta = max - min

      steps.times do |index|
        eps = index * delta / (steps - 1)
        yield(min + eps)
      end
    end
    
    private

    attr_reader :options

    delegate :min_infection,  :max_infection,  :infection_points,  :infection,  to: :options
    delegate :min_mutation,   :max_mutation,   :mutation_points,   :mutation,   to: :options
    delegate :min_activation, :max_activation, :activation_points, :activation, to: :options
  end
end
