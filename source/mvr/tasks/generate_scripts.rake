# frozen_string_literal: true

require 'yaml'

namespace :mvr do
  desc 'generate gnuplot scripts'
  task :generate_scripts do
    yml = YAML.load_file('./mvr/parameters/simulate.yml')
    yml["jobs"].each do |params|
      Simulation::Gnuplot.generate(params)
    end
  end
end
