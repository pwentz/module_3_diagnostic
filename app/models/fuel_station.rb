class FuelStation < OpenStruct
  def self.service
    @@service ||= NrelService.new
  end

  def self.instantiate_fuel_stations(raw_stations)
    require 'pry'; binding.pry
    raw_stations.each do |station|
      FuelStation.new(
      )
    end
  end
end
