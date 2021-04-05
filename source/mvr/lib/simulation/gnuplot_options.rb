# frozen_string_literal: true

require 'sinclair'

module Simulation
  class GnuplotOptions < Sinclair::Options
    with_options :output, :template
    with_options(
      xlabel: 'X',
      ylabel: 'Y',
      title: false
    )
    skip_validation
  end
end
