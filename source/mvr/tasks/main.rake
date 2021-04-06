# frozen_string_literal: true

require_relative '../lib/mvr'

import 'mvr/tasks/simulate.rake'
import 'mvr/tasks/generate_scripts.rake'
import 'mvr/tasks/plot.rake'
import 'mvr/tasks/clean.rake'

namespace :mvr do
  desc 'Run all task'
  task all: %i[simulate generate_scripts plot]

  desc 'rebuild scripts and replot'
  task replot: %i[generate_scripts plot]
end
