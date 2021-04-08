# frozen_string_literal: true

module Simulation
  module GnuplotHelper
    def set_title
      @title ? "set title '#{@title}'" : 'set notitle'
    end

    def columns_string
      "($#{@columns.join('):($')})"
    end

    def plot_files
      strings = plots.map { |plot| file_line(plot) }

      "plot #{strings.join(", \\\n")}"
    end

    def set_key
      plots.any?(&:key) ? "" : "set nokey" 
    end

    def file_line(plot)
        parts = ["\"#{@data_file}\" u ($#{plot.columns.join('):($')}) w lines"]
        parts << "t \"#{plot.key}\"" if plot.key
        parts.join(" ")
    end

    def set_xrange
      @xrange ? "set xr [#{@xrange.join(':')}]" : ''
    end

    def set_yrange
      @yrange ? "set yr [#{@yrange.join(':')}]" : ''
    end

    def set_palette
      map = %w[red yellow white green blue].as_hash(@palette_points)
      map_string = map.map { |key, value| "#{key} \"#{value}\"" }.join(",")
      "set palette defined (#{map_string})"
    end
  end
end
