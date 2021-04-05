module Simulation
  module GnuplotHelper
    def set_title
      @title ? "set title '#{@title}'" : 'set notitle'
    end

    def columns
      "($#{@x_column}):($#{@y_column})"
    end

    def set_xrange
      @xrange ? "set xr [#{@xrange.join(':')}]" : ""
    end

    def set_yrange
      @yrange ? "set yr [#{@yrange.join(':')}]" : ""
    end
  end
end
