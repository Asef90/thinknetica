# frozen_string_literal: true

class CargoCar < Car
  attr_reader :volume, :occupied_volume, :free_volume

  def initialize(number, volume)
    super(number)
    @type = 'Cargo'
    @volume = volume
    @occupied_volume = 0
    @free_volume = volume
  end

  def cargo_car?
    true
  end

  def occupy_volume(volume)
    return unless volume <= free_volume

    self.occupied_volume += volume
    self.free_volume -= volume
  end

  private

  attr_writer :occupied_volume, :free_volume
end
