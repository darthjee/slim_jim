module Simulation
  class BatchOptions < Sinclair::Options
    with_options :min_infection,  :max_infection,  :infection_points
    with_options :min_mutation,   :max_mutation,   :mutation_points
    with_options :min_activation, :max_activation, :activation_points
  end
end

