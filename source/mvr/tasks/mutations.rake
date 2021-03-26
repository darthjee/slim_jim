# frozen_string_literal: true

namespace :mvr do
  desc 'Simulate mutations'
  task :simulate do
    puts Simulation::Simulation.simulate(1_000_000, 0.1, 0.1)
  end
end
