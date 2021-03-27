# frozen_string_literal: true

namespace :mvr do
  desc 'Simulate mutations'
  task :simulate do
    puts Simulation::BulkSimulation.simulate(
      population: 1_000_000, 
      infection: 0.1,
      mutation: 0.1,
      repetitions: 10
    )
  end
end
