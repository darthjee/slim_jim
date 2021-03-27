# frozen_string_literal: true

namespace :mvr do
  desc 'Simulate mutations'
  task :simulate do
    puts Simulation::BulkSimulation.simulate(
      population: 1_000_000,
      activation: 0.01,
      mutation: 0.01,
      infection: 0.1,
      repetitions: 10
    )
  end
end
