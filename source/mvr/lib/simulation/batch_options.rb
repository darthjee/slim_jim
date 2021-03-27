module Simulation
  class BatchOptions < Sinclair::Options
    with_options :min_infection, :max_infection, :infection_points
  end
end

