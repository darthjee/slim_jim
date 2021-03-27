module Simulation
  class Batch
    private_class_method :new

    def self.run(*args)
      new(*args).run
    end

    def initialize(options_hash)
      @options = BatchOptions.new(options_hash)
    end

    def run
      for_all(:infection) do |infection|
        puts infection
      end
    end

    private

    attr_reader :options

    delegate :for_all, to: :options
  end
end
