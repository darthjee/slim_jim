class Vaccinated
  def initialize(population, infection, mutation)
    @population = population
    @probability = probability
  end

  def infected
    @infected ||= calculate
  end

  def mutated
    @mutated ||= Infected.new(infected, mutation).mutated
  end

  private

  attr_reader :population, :infection, :mutation

  def calculate
    count = 0
    population.times do
      count += 1 if Random.rand <= infection
    end
    count
  end
end

puts Infected
