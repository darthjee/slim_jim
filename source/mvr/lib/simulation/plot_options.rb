# frozen_string_literal: true

require 'sinclair'

module Simulation
  class PlotOptions < Sinclair::Options
    with_options :data_file, :key
   
    with_options(columns: [1, 12])
    skip_validation
  end
end
