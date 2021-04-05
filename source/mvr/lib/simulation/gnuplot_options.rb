# frozen_string_literal: true

require 'sinclair'

module Simulation
  class GnuplotOptions < Sinclair::Options
    with_options :output, :template
    with_options(
      xlabel: 'X',
      ylabel: 'Y'
    )
    skip_validation
  end
end
