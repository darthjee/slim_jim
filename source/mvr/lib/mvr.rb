# frozen_string_literal: true

lib = File.expand_path(__dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'danica'
require 'safe_attribute_assignment'

autoload :Collection, 'collection'
autoload :DatFile,    'dat_file'
autoload :Utils,      'utils'
autoload :Simulation, 'simulation'
