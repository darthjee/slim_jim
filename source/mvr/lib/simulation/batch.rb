# frozen_string_literal: true

module Simulation
  class Batch
    private_class_method :new

    KEYS = %i[
      infection mutation activation population repetitions
      infected infected_deviance vaccinated vaccinated_deviance
      ratio ratio_deviance log_ratio
    ]

    def self.run(options_hash = {})
      new(options_hash.symbolize_keys).run
    end

    def initialize(options_hash)
      @options = BatchOptions.new(
        options_hash.merge(options_hash[:data])
      )
    end

    def run
      simulate_all
    end

    private

    attr_reader :options

    delegate :for_all, to: :iterator
    delegate :data_file, :population, :repetitions, to: :options

    def simulate_all
      for_all(:infection) do |infection|
        for_all(:mutation) do |mutation|
          for_all(:activation) do |activation|
            file.write simulate(infection, mutation, activation)
          end
        end
      end
    end

    def iterator
      @iterator ||= Iterator.new(options)
    end

    def simulate(infection, mutation, activation)
      BulkSimulation.simulate(
        infection: infection,
        mutation: mutation,
        activation: activation,
        population: population,
        repetitions: repetitions
      )
    end

    def file
      @file ||= DatFile.new(file_path, KEYS)
    end

    def file_path
      "mvr/data/#{data_file}.dat"
    end
  end
end
