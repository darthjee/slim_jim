# frozen_string_literal: true

require 'sinclair'

module Simulation
  class Options < Sinclair::Options
    skip_validation
    with_options :resimulate
    with_options :jobs

    def jobs_options
      jobs.map do |job|
        JobOptions.new(
          job.merge(resimulate: resimulate)
        )
      end
    end
  end
end
