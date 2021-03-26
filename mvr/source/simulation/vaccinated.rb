class Vaccinated
  def initialize(population, probability)
    @population = population
    @probability = probability
  end

  def infected
    @infected ||= calculate
  end

  def mutated
    @mutated ||= Infected.new(infected, 
  end

  private

  attr_reader :population, :probability

  def calculate
    count = 0
    population.times do
      count += 1 if Random.rand <= probability
    end
    count
  end
end
