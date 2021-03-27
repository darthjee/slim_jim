class Collection
  attr_reader :values

  delegate :size, to: :values

  def initialize(values)
    @values = values
  end

  def average
    @average ||= values.average
  end

  def deviance
    @deviance ||= Math.sqrt(squared_deviances.sum / size)
  end

  private

  def squared_deviances
    values.map do |value|
      (value - average) ** 2
    end
  end
end
