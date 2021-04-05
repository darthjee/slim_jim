module Simulation
  class Gnuplot
    private_class_method :new

    def self.generate(*args)
      new(*args).generate
    end

    def initialize(options_hash)
      @options = GnuplotOptions.new(options_hash)
    end

    def generate
      template.build
    end

    private

    attr_reader :options
    delegate :output, to: :options

    def template
      @template ||= Utils::Template.new(
        "mvr/templates/#{options.template}.gnu.erb",
        "mvr/gnuplot/#{output}.gnu"
      )
    end
  end
end
