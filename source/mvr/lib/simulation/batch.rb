module Simulation
  class Batch
    private_class_method :new

    def self.run(*args)
      new(*args).run
    end

    def initialize(*args)
      puts args
    end

    def run
    end
  end
end
