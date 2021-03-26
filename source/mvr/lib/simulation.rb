# frozen_string_literal: true

lib = File.expand_path(__dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

module Simulation
  autoload :Infected, 'simulation/infected'
  autoload :Vaccinated, 'simulation/vaccinated'
  autoload :Simulation, 'simulation/simulation'
end
