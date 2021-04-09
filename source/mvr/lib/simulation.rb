# frozen_string_literal: true

module Simulation
  autoload :Batch,          'simulation/batch'
  autoload :BatchOptions,   'simulation/batch_options'
  autoload :BulkSimulation, 'simulation/bulk_simulation'
  autoload :Infected,       'simulation/infected'
  autoload :Iterator,       'simulation/iterator'
  autoload :JobOptions,     'simulation/job_options'
  autoload :Simulation,     'simulation/simulation'
  autoload :SingleResult,   'simulation/single_result'
  autoload :Result,         'simulation/result'
  autoload :Vaccinated,     'simulation/vaccinated'
  autoload :Gnuplot,        'simulation/gnuplot'
  autoload :GnuplotHelper,  'simulation/gnuplot_helper'
  autoload :GnuplotOptions, 'simulation/gnuplot_options'
  autoload :PlotOptions,    'simulation/plot_options'
  autoload :Options,        'simulation/options'
end
