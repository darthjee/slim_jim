# frozen_string_literal: true

require 'sinclair'

module Simulation
  class JobOptions < Sinclair::Options
    skip_validation
    with_options :resimulate, :data_file, :data, :plot

    def batch_options
      BatchOptions.new(
        data.merge(
          resimulate: resimulate,
          data_file: data_file
        )
      )
    end

    def plot_options
      GnuplotOptions.new(
        plot.merge(
          data_file: data_file
        )
      )
    end
  end
end
