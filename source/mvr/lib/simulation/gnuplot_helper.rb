module Simulation
  module GnuplotHelper
    def set_title
      @title ? "set title '#{@title}'" : 'set no title'
    end
  end
end
