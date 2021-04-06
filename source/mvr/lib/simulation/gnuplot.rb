# frozen_string_literal: true

module Simulation
  class Gnuplot
    private_class_method :new

    def self.generate(options)
      new(options).generate
    end

    def self.clean(options)
      new(options).clean
    end

    def initialize(options)
      @options = options
    end

    def generate
      puts "Generating #{script_path}"
      template.build
    end

    def clean
      FileUtils.rm_rf script_path
      FileUtils.rm_rf plot_output
    end

    private

    attr_reader :options
    delegate :output, to: :options

    def template
      @template ||= Utils::Template.new(
        "mvr/templates/#{options.template}.gnu.erb",
        script_path,
        variables,
        [GnuplotHelper]
      )
    end

    def variables
      options.variables.merge(
        output: plot_output
      )
    end

    def script_path
      "mvr/gnuplot/#{output}.gnu"
    end

    def plot_output
      "mvr/plots/#{output}.png"
    end
  end
end
