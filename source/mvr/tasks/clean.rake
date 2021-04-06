# frozen_string_literal: true

require 'yaml'

namespace :mvr do
  desc 'Clean files'
  task :clean do
    yml = YAML.load_file('./mvr/parameters/simulate.yml')
    options = Simulation::Options.new(yml)

    options.jobs_options.each do |job_options|
      if job_options.data?
        Simulation::Batch.clean(
          job_options.batch_options
        )
      end

      job_options.plots_options.each do |options|
        Simulation::Gnuplot.clean(options)
      end
    end
  end
end
