# frozen_string_literal: true

require 'sinclair'

module Simulation
  class GnuplotOptions < Sinclair::Options
    with_options :output, :template, :data_file, :xrange, :yrange
    with_options(
      columns: [1, 12],
      xlabel: 'Infection',
      ylabel: 'log(ratio)',
      title: false,
      infection: 0.3,
      palette_points: [-1, -0.5, 0, 2, 4],
      plots: [{}]
    )
    skip_validation

    def variables
      {
        data_file: data_file_path,
        xlabel: xlabel,
        ylabel: ylabel,
        xrange: xrange,
        yrange: yrange,
        columns: columns,
        title: title,
        infection: infection,
        palette_points: palette_points,
        plots: plots_options
      }
    end

    def data_file_path
      "mvr/data/#{data_file}.dat"
    end

    def plots_options
      plots
    end
  end
end
