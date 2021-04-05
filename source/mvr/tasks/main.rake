# frozen_string_literal: true

require_relative '../lib/mvr'

import 'mvr/tasks/simulate.rake'
import 'mvr/tasks/generate_scripts.rake'
import 'mvr/tasks/plot.rake'

namespace :mvr do
  desc 'Run all task'
  task all: %i(simulate generate_scripts plot)
end
