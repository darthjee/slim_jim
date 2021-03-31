# frozen_string_literal: true

module Simulation
  class Batch
    private_class_method :new
    KEYS = %i[infected infected_deviance vaccinated vaccinated_deviance
    ratio ratio_deviance log_ratio log_ratio_deviance]

    def self.run(*args)
      new(*args).run
    end

    def initialize(options_hash)
      @options = BatchOptions.new(options_hash)
    end

    def run
      simulate_all
      data_file.close
    end

    private

    attr_reader :options

    delegate :for_all, to: :iterator
    delegate :output, :population, :repetitions, to: :options

    def simulate_all
      for_all(:infection) do |infection|
        for_all(:mutation) do |mutation|
          for_all(:activation) do |activation|
            data_file.write simulate(infection, mutation, activation)
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

    def data_file
      @data_file ||= DatFile.new(data_file_path, KEYS)
    end

    def data_file_path
      "mvr/data/#{output}.dat"
    end
  end
end
