# frozen_string_literal: true

require 'sinclair'

module Simulation
  class BatchOptions < Sinclair::Options
    with_options :output, :population, :repetitions
    with_options :min_infection,  :max_infection,  :infection_points
    with_options :min_mutation,   :max_mutation,   :mutation_points
    with_options :min_activation, :max_activation, :activation_points
    with_options :infection, :mutation, :activation
  end
end
