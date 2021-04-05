module Simulation
  module GnuplotHelper
    def set_title
      @title ? "set title '#{@title}'" : 'set notitle'
    end

    def columns
      "($#{@x_column}):($#{@y_column})"
    end
  end
end
