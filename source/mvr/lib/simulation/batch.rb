module Simulation
  class Batch
    private_class_method :new

    def self.simulate(*args)
      new(*args).result
    end
  end
end
