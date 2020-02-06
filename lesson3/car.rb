# frozen_string_literal: true

class Car
  include Manufacturer
  attr_reader :number, :type

  def initialize(number)
    @number = number
  end

  def passenger_car?; end

  def cargo_car?; end
end
