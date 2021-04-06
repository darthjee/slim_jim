# frozen_string_literal: true

require 'yaml'

namespace :mvr do
  desc 'Clean files'
  task :clean do
    yml = YAML.load_file('./mvr/parameters/simulate.yml')
    yml["jobs"].each do |params|
      Simulation::Batch.clean(params)
    end
  end
end

