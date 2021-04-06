# frozen_string_literal: true

require 'yaml'

namespace :mvr do
  desc 'generate gnuplot scripts'
  task :generate_scripts do
    yml = YAML.load_file('./mvr/parameters/simulate.yml')
    options = Simulation::Options.new(yml)

    options.jobs_options.each do |job_options|
      Simulation::Gnuplot.generate(
        job_options.plot_options
      )
    end
  end
end
