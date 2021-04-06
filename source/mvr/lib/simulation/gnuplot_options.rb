# frozen_string_literal: true

require 'sinclair'

module Simulation
  class GnuplotOptions < Sinclair::Options
    with_options :output, :template, :data_file, :xrange, :yrange
    with_options(
      x_column: 1,
      y_column: 12,
      xlabel: 'Infection',
      ylabel: 'log(ratio)',
      title: false,
      infection: 0.3
    )
    skip_validation

    def variables
      {
        data_file: data_file_path,
        xlabel: xlabel,
        ylabel: ylabel,
        xrange: xrange,
        yrange: yrange,
        x_column: x_column,
        y_column: y_column,
        title: title,
        infection: infection,
      }
    end

    def data_file_path
      "mvr/data/#{data_file}.dat"
    end
  end
end
