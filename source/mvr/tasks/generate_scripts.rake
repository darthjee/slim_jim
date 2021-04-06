# frozen_string_literal: true

require 'yaml'

namespace :mvr do
  desc 'generate gnuplot scripts'
  task :generate_scripts do
    yml = YAML.load_file('./mvr/parameters/simulate.yml')
    options = Simulation::Options.new(yml)

    options.jobs_options.each do |job_options|
      job_options.plots_options.each do |option|
        Simulation::Gnuplot.generate(option)
      end
    end
  end
end
