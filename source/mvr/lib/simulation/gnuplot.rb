module Simulation
  class Gnuplot
    private_class_method :new

    def self.generate(*args)
      new(*args).run
    end

    def initialize(output:, template:, **_)
      @output = output
      @template_file = template
    end

    def generate
      template.build
    end

    private

    attr_reader :template_file

    def template
      @template ||= Utils::Template.new(
        "mvr/templates/#{template_file}.gnu.erb",
        "mvr/gnuplot/#{output}.gnu"
      )
    end
  end
end
