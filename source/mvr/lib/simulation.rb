lib = File.expand_path('..', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

module Simulation
  autoload :Infected, 'simulation/infected'
  autoload :Vaccinated, 'simulation/vaccinated'
end
