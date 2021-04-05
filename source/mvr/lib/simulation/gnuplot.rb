module Simulation
  class Gnuplot
    private_class_method :new

    def self.generate(options_hash = {})
      new(options_hash.symbolize_keys).generate
    end

    def initialize(options_hash)
      @options = GnuplotOptions.new(
        options_hash.merge(options_hash[:plot])
      )
    end

    def generate
      template.build
    end

    private

    attr_reader :options
    delegate :output, :xlabel, :ylabel, :title, to: :options

    def template
      @template ||= Utils::Template.new(
        "mvr/templates/#{options.template}.gnu.erb",
        "mvr/gnuplot/#{output}.gnu",
        variables,
        [GnuplotHelper]
      )
    end

    def variables
      {
        output: plot_output,
        xlabel: xlabel,
        ylabel: ylabel,
        title: title
      }
    end

    def plot_output
      "mvr/plots/#{output}.png"
    end
  end
end
