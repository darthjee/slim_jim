module Simulation
  module GnuplotHelper
    def set_title
      @title ? "set title '#{@title}'" : 'set notitle'
    end
  end
end
