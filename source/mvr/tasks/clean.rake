# frozen_string_literal: true

require 'yaml'

namespace :mvr do
  desc 'Clean files'
  task :clean do
    yml = YAML.load_file('./mvr/parameters/simulate.yml')
    options = Simulation::Options.new(yml)

    options.jobs_options.each do |job_options|
      Simulation::Batch.clean(
        job_options.batch_options
      )
    end
  end
end

