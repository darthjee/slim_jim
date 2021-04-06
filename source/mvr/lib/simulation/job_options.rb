# frozen_string_literal: true

require 'sinclair'

module Simulation
  class JobOptions < Sinclair::Options
    skip_validation
    with_options :resimulate, :data_file, :data, :plots

    def data?
      data.present?
    end

    def batch_options
      BatchOptions.new(
        data.merge(
          resimulate: resimulate,
          data_file: data_file
        )
      )
    end

    def plots_options
      [plots].flatten.map do |plot|
        GnuplotOptions.new(
          plot.merge(
            data_file: data_file
          )
        )
      end
    end
  end
end
