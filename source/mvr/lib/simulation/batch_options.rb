# frozen_string_literal: true

require 'sinclair'

module Simulation
  class BatchOptions < Sinclair::Options
    skip_validation
    with_options :data_file, :population, :repetitions
    with_options :min_infection,  :max_infection,  :infection_points
    with_options :min_mutation,   :max_mutation,   :mutation_points
    with_options :min_activation, :max_activation, :activation_points
    with_options :infection, :mutation, :activation
  end
end
