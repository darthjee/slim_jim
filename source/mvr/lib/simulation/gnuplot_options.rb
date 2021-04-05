# frozen_string_literal: true

require 'sinclair'

module Simulation
  class GnuplotOptions < Sinclair::Options
    with_options :template, :output
    skip_validation
  end
end
