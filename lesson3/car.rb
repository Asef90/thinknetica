class Car
  include Manufacturer
  include Validation

  attr_reader :number, :type

  validate :number, :presence

  def initialize(number)
    @number = number
    validate!
  end

  def passenger_car?; end

  def cargo_car?; end
end
