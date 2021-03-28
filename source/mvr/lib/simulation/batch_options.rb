require 'sinclair'

module Simulation
  class BatchOptions < Sinclair::Options
    with_options :output, :population, :repetitions
    with_options :min_infection,  :max_infection,  :infection_points,  :infection
    with_options :min_mutation,   :max_mutation,   :mutation_points,   :mutation
    with_options :min_activation, :max_activation, :activation_points, :activation
  end
end

