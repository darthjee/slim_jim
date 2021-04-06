# frozen_string_literal: true

module Simulation
  class Batch
    private_class_method :new

    KEYS = %i[
      infection mutation activation population repetitions
      infected infected_deviance vaccinated vaccinated_deviance
      ratio ratio_deviance log_ratio
    ].freeze

    def self.run(options)
      new(options).run
    end

    def self.clean(options)
      new(options).clean
    end

    def initialize(options)
      @options = options
    end

    def run
      return unless process?

      puts "Simulating #{file_path}"
      simulate_all
    end

    def clean
      FileUtils.rm_rf file_path
    end

    private

    attr_reader :options

    delegate :for_all, to: :iterator
    delegate :data_file, :repetitions, to: :options

    def process?
      return true unless File.exists? file_path
      options.resimulate
    end

    def simulate_all
      for_all(:population) do |population|
        for_all(:infection) do |infection|
          for_all(:mutation) do |mutation|
            for_all(:activation) do |activation|
              file.write simulate(population, infection, mutation, activation)
            end
          end
        end
      end
    end

    def iterator
      @iterator ||= Iterator.new(options)
    end

    def simulate(population, infection, mutation, activation)
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
