# frozen_string_literal: true

lib = File.expand_path(__dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'danica'

module Simulation
  autoload :BulkSimulation, 'simulation/bulk_simulation'
  autoload :Infected,       'simulation/infected'
  autoload :Simulation,     'simulation/simulation'
  autoload :SingleResult,   'simulation/single_result'
  autoload :Result,         'simulation/result'
  autoload :Vaccinated,     'simulation/vaccinated'
end
