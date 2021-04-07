# frozen_string_literal: true

require 'sinclair'

module Simulation
  class BatchOptions < Sinclair::Options
    skip_validation
    with_options :resimulate
    with_options :data_file, :repetitions
    with_options :min_population, :max_population, :population_points
    with_options :min_infection,  :max_infection,  :infection_points
    with_options :min_mutation,   :max_mutation,   :mutation_points
    with_options :min_activation, :max_activation, :activation_points
    with_options :population, :infection, :mutation, :activation
  end
end
