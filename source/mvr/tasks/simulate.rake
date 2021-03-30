# frozen_string_literal: true

require 'yaml'

namespace :mvr do
  desc 'Simulate mutations'
  task :simulate do
    yml = YAML.load_file('./mvr/parameters/simulate.yml')
    yml.each do |params|
      Simulation::Batch.run(params)
    end
  end
end
