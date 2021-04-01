# frozen_string_literal: true

require 'yaml'

namespace :mvr do
  desc 'generate gnuplot scripts'
  task :generate_scripts do
    yml = YAML.load_file('./mvr/parameters/simulate.yml')
    yml.each do |params|
      echo params
    end
  end
end
